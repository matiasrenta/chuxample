class ProjectActivitySocial < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| model.try(:social_development_program).try(:name)}
          }



  #belongs_to :parent_project, class_name: 'ProjectSocial', foreign_key: 'project_social_id'
  #alias_attribute :project_social, :parent_project

  belongs_to :project_social
  belongs_to :social_development_program
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error
  has_many :beneficiaries, dependent: :delete_all

  validates :social_development_program_id, :comentarios, :project_social_id, presence: true
  validates :nro_beneficiarios, numericality: true, if: :nro_beneficiarios
  validates :nro_metas_cumplidas, numericality: true, if: :nro_metas_cumplidas

  before_create do
    self.name = social_development_program.try(:name)
  end

  scope :by_project_year, -> (year){joins("INNER JOIN key_analyticals ON key_analyticals.id = project_activity_socials.project_social_id AND (key_analyticals.year = #{year})")}

  def parent_project
    self.project_social
  end

  def calculate_and_save_ejercido
    # ahora solo se suman las facturas, quitar la siguiente linea si no se cambia de opinión
    #self.ejercido = FinancialDocument.bills_and_contracts.without_contract.by_activities([self.id], self.class.name).sum(:monto)
    self.ejercido = FinancialDocument.bills.by_activities([self.id], self.class.name).sum(:monto)
    save
  end

  def except_attr_in_public_activity
    [:id, :updated_at, :ejercido]
  end

end
