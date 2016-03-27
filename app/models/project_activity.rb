class ProjectActivity < ActiveRecord::Base
  has_many :financial_documents, dependent: :restrict_with_error

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


  belongs_to :key_analytical

  validates :key, :name, :description, :key_analytical_id, presence: true
  validates :key_analytical_id, numericality: true

  accepts_nested_attributes_for :financial_documents, allow_destroy: true



  def except_attr_in_public_activity
    [:id, :updated_at]
  end
end