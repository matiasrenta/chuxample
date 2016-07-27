class NominaDocument < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| "#{model.try(:month)} #{model.try(:year)}" }
          }

  has_many :nomina_document_items, dependent: :destroy
  accepts_nested_attributes_for :nomina_document_items, allow_destroy: true

  attachment :file, extension: %w[jpg jpeg png gif pdf doc docx xls xlsx], store: 's3_nomina_doc_backend', cache: 's3_nomina_doc_cache'
  #content_type: %w[image/jpeg image/png image/gif text/plain application/pdf application/doc application/docx]


  validates :month, :year, :file, presence: true

  after_destroy :remove_file_attached


  def except_attr_in_public_activity
    [:id, :file_id, :updated_at]
  end

  private

  def remove_file_attached
    file.try(:delete)
  end

end
