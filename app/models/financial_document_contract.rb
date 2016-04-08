class FinancialDocumentContract < FinancialDocument

  before_destroy :check_bills

  has_many :financial_document_bills#, dependent: :restrict_with_error # HICE EL BEFORE_DESTROY PARA PERSONALIZAR EL MENSAJE

  validates :nro_documento, :monto, :supplier_id, presence: true

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
