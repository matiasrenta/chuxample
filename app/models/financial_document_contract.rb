class FinancialDocumentContract < FinancialDocument

  before_destroy :check_bills

  has_many :financial_document_bills#, dependent: :restrict_with_error # HICE EL BEFORE_DESTROY PARA PERSONALIZAR EL MENSAJE

  validates :nro_documento, :monto, :supplier_id, presence: true

  scope :by_project_activityable, -> (pa){where(project_activityable: pa)}

  def nro_doc_and_supplier
    "#{nro_documento} - #{supplier.try(:name)}"
  end

  private

  def check_bills
    if financial_document_bills.any?
      errors.add(:base, "Existen documentos asociados a este contrato: (#{financial_document_bills.map(&:nro_documento).join(', ')})")
      return false
    else
      return true
    end
  end

end
