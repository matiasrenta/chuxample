class ProjectActivityObra < ActiveRecord::Base
  has_many :verifications, dependent: :destroy
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
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error

  validates :name, :cantidad, :project_obra_id, :calle, :nro_exterior, :colonia, presence: true
  validates :cantidad, :project_obra_id, numericality: true
  validates :avance_programado, numericality: true, if: :avance_programado
  validates :avance_real, numericality: true, if: :avance_real

  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?

  def parent_project
    self.project_obra
  end

  def full_address
    # ejepmlo: "Chilpancingo 53, Hipódromo, Cuauhtemnoc, Ciudad de México, México"
    "#{calle} #{nro_exterior}, #{colonia}, Cuauhtemnoc, Ciudad de México, México"
  end

  def full_address_changed?
    calle_changed? || nro_exterior_changed? || colonia_changed?
  end

  def except_attr_in_public_activity
    [:id, :updated_at]
  end
end
