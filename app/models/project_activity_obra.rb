class ProjectActivityObra < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| model.try(:name)}
          }


  belongs_to :project_obra
  #alias_attribute :parent_project, :project_obra #esto debería reemplazar al metodo feo "def parent_project". pero primero debo probar si funciona
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error
  has_many :verifications, dependent: :destroy

  validates :name, :cantidad, :project_obra_id, :calle, :nro_exterior, :colonia, presence: true
  validates :cantidad, :project_obra_id, numericality: true
  validates :avance_programado, numericality: true, if: :avance_programado
  validates :avance_real, numericality: true, if: :avance_real

  scope :with_verifications_approved, -> {joins(:verifications).where('verifications.status = 1').group('project_activity_obras.id')} # el group es para que no vengan filas repetidas
  scope :without_verifications_approved, -> {where('NOT EXISTS (select * from verifications v where v.project_activity_obra_id = project_activity_obras.id AND status = 1)')}
  # actividades que un usuario no ha verificado hoy, y si las ha verificado antes entonces 'v.created_at' es la fecha de la última vez que verificó
  scope :verificables_by_user, -> (owneable){ find_by_sql(
    "
      SELECT pao.*, v.created_at as verificated_at
      FROM project_activity_obras pao
      LEFT JOIN verifications v ON (pao.id = v.project_activity_obra_id AND v.verification_owneable_id = #{owneable.id} AND v.verification_owneable_type = '#{owneable.class.name}')
      WHERE NOT EXISTS (select * from verifications v2
                         where v2.project_activity_obra_id = pao.id
                           and v2.verification_owneable_id = #{owneable.id}
                           and v2.verification_owneable_type = '#{owneable.class.name}'
                           and v2.created_at BETWEEN '#{Date.today.beginning_of_day.utc.strftime("%Y-%m-%d %H:%M:%S")}' AND '#{Date.today.end_of_day.utc.strftime("%Y-%m-%d %H:%M:%S")}'
                        )
      AND (v.created_at IS NULL OR v.created_at = (select max(v3.created_at)
                                                     from verifications v3
                                                    where v3.project_activity_obra_id = pao.id
                                                      and v3.verification_owneable_id = #{owneable.id}
                                                      and v3.verification_owneable_type = '#{owneable.class.name}'))
      ORDER BY verificated_at DESC, pao.name ASC
    ")
  }

  scope :by_project_year, -> (year){joins("INNER JOIN key_analyticals ON key_analyticals.id = project_activity_obras.project_obra_id AND (key_analyticals.year = #{year})")}

  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?

  def parent_project
    self.project_obra
  end

  def calculate_and_save_ejercido
    # ahora solo se suman las facturas, quitar la siguiente linea si no se cambia de opinión
    #self.ejercido = FinancialDocument.bills_and_contracts.without_contract.by_activities([self.id], self.class.name).sum(:monto)
    self.ejercido = FinancialDocument.bills.by_activities([self.id], self.class.name).sum(:monto)
    save
  end

  def full_address
    # ejepmlo: "Chilpancingo 53, Hipódromo, Cuauhtemnoc, Ciudad de México, México"
    "#{calle} #{nro_exterior}, #{colonia}, Cuauhtemnoc, Ciudad de México, México"
  end

  def full_address_changed?
    calle_changed? || nro_exterior_changed? || colonia_changed?
  end

  def except_attr_in_public_activity
    [:id, :updated_at, :ejercido]
  end

end
