class FinancialDocumentBill < FinancialDocument
  belongs_to :financial_document_contract

  validates :nro_documento, :monto, :supplier_id, presence: true
end
