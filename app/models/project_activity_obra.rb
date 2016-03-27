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
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error

  validates :name, :cantidad, :project_obra_id, presence: true
  validates :cantidad, :project_obra_id, numericality: true
  validates :avance_programado, numericality: true, if: :avance_programado
  validates :avance_real, numericality: true, if: :avance_real


  def except_attr_in_public_activity
    [:id, :updated_at]
  end
end
