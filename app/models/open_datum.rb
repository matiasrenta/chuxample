class OpenDatum < ActiveRecord::Base
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


  attachment :file, store: 's3_open_data_backend', cache: 's3_open_data_cache'

  validates :title, :published_by, :file, presence: true
  validates :email, email: {message: I18n.t('errors.messages.invalid_email')}, if: :email



  after_destroy :remove_file




  def except_attr_in_public_activity
    [:id, :updated_at]
  end

  private

  def remove_file
    file.try(:delete)
  end

end
