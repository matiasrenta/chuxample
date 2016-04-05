class FinancialDocument < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| model.to_label}
          }


  belongs_to :project_activityable, polymorphic: true
  belongs_to :financial_document_type
  belongs_to :supplier

  attachment :file, extension: %w[jpg jpeg png gif pdf doc docx], store: 's3_backend', cache: 's3_cache'
  #content_type: %w[image/jpeg image/png image/gif text/plain application/pdf application/doc application/docx]

  validates :financial_document_type_id, :file, presence: true
  # las demas validaciones estan en cada tipo de documento

  after_destroy :remove_file_attached

  def grupo_factura?
    type == 'FinancialDocumentBill'
  end

  def grupo_contrato?
    type == 'FinancialDocumentContract'
  end

  def grupo_other?
    type == 'FinancialDocumentOther'
  end

  def except_attr_in_public_activity
    [:id, :file_id, :updated_at]
  end

  def to_label
    "#{financial_document_type.name}, nro. #{self.nro_documento}"
  end


  # no puedo ponerlo como una validacion porque refile lo borra despues de validarlo creo
  def check_file_presence_on_update(params)
    if params[:financial_document][:file] == '{}' && params[:financial_document][:remove_file] == '1'
      errors.add(:file, I18n.t('errors.messages.blank'))
      return false
    else
      return true
    end
  end

  private

  def remove_file_attached
    file.try(:delete)
  end

end
