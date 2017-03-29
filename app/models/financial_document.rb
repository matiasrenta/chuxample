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

  # las siguientes son para poder hacer eager load (joins(:project_activity_obra) por ejemplo. Porque no puedo hacer: joins(:project_activityable))
  belongs_to :project_activity_obra, -> { joins(:reviews) .where(reviews: {reviewable_type: 'Shop'}) }, foreign_key: 'reviewable_id'

  attachment :file, extension: %w[jpg jpeg png gif pdf doc docx], store: 's3_financial_documents_backend', cache: 's3_financial_documents_cache'
  #content_type: %w[image/jpeg image/png image/gif text/plain application/pdf application/doc application/docx]

  validates :financial_document_type_id, :file, presence: true
  # las demas validaciones estan en cada tipo de documento

  after_save :calculate_ejercido
  after_destroy :remove_file_attached, :calculate_ejercido

  scope :bills, -> {where(:type => 'FinancialDocumentBill')}
  scope :contracts, -> {where(:type => 'FinancialDocumentContract')}
  scope :bills_and_contracts, -> {where(type: ['FinancialDocumentBill', 'FinancialDocumentContract'])}
  scope :without_contract, -> {where("financial_document_contract_id IS NULL")}
  scope :by_activities, -> (activities_ids, activityable_type){where(project_activityable_id: activities_ids, project_activityable_type: activityable_type)}
  scope :adquisicions, -> {where(project_activityable_type: 'ProjectActivityAdquisicion')}
  scope :obras, -> {where(project_activityable_type: 'ProjectActivityObra')}
  scope :socials, -> {where(project_activityable_type: 'ProjectActivitySocial')}

  # este scope obtiene todos los documentos financieros de los proyectos de un año en particular. porque esto no se puede hacer: scope :by_project_year, ->(year){joins(project_activityable: [:parent_project]).where('key_analyticals.year = ?', year)}
  scope :by_project_year, -> (year) do
    a = adquisicions.joins("INNER JOIN project_activity_adquisicions ON project_activity_adquisicions.id = financial_documents.project_activityable_id
                        INNER JOIN key_analyticals ON key_analyticals.id = project_activity_adquisicions.project_adquisicion_id AND (key_analyticals.year = #{year})")

    o = obras.joins("INNER JOIN project_activity_obras ON project_activity_obras.id = financial_documents.project_activityable_id
                 INNER JOIN key_analyticals ON key_analyticals.id = project_activity_obras.project_obra_id AND (key_analyticals.year = #{year})")

    s = socials.joins("INNER JOIN project_activity_socials ON project_activity_socials.id = financial_documents.project_activityable_id
                 INNER JOIN key_analyticals ON key_analyticals.id = project_activity_socials.project_social_id AND (key_analyticals.year = #{year})")

    a.union(o.union(s))
  end

  def friendly_type
    return 'Factura' if grupo_factura?
    return 'Contrato' if grupo_contrato?
    return '' if grupo_other?
  end

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

  # calcula y setea el ejercido de la actividad y del Project a la que pertenece este Financial Documents
  # si el documento no es factura o contrato pues quedará igual el ejercido, pero no cuesta nada siempre calcularlo
  # se calcula after_save y after_destroy
  def calculate_ejercido
    project_activityable.calculate_and_save_ejercido
    project_activityable.parent_project.calculate_and_save_ejercido
  end

end
