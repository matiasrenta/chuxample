class ProjectActivitySocial < ActiveRecord::Base
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


  belongs_to :project_social
  belongs_to :social_development_program
  has_many :financial_documents, as: :project_activityable, dependent: :restrict_with_error

  validates :social_development_program_id, :comentarios, :project_social_id, presence: true
  validates :social_development_program_id, :nro_beneficiarios, :nro_metas_cumplidas, :project_social_id, numericality: true




  def except_attr_in_public_activity
    [:id, :updated_at]
  end
end
