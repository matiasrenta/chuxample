class FinancialDocument < ActiveRecord::Base
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


  belongs_to :project_activityable, polymorphic: true
  belongs_to :financial_document_type
  belongs_to :supplier

  attachment :file, extension: %w[jpg jpeg png gif pdf doc docx], store: 's3_backend', cache: 's3_cache'
  #content_type: %w[image/jpeg image/png image/gif text/plain application/pdf application/doc application/docx]

  after_destroy :remove_file

  def grupo_factura?
    type == 'FinancialDocumentBill'
  end


  def except_attr_in_public_activity
    [:id, :updated_at]
  end

  private

  def remove_file
    file.try(:delete)
  end
end
