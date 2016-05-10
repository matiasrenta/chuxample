class ProjectActivityNomina < ActiveRecord::Base
  has_many :paysheets, dependent: :restrict_with_error
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


  belongs_to :project_nomina
  belongs_to :ascription
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error

  validates :nro_trabajadores, :mes, :comentarios, :project_nomina_id, presence: true
  validates :nro_trabajadores, :ascription_id, :project_nomina_id, numericality: true
  validates :ascription_id, numericality: true, if: 'ascription_id'



  def except_attr_in_public_activity
    [:id, :updated_at]
  end
end
