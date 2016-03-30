class FinancialDocumentType < ActiveRecord::Base
  has_many :financial_documents, dependent: :restrict_with_error
  has_and_belongs_to_many :chapters, join_table: 'fin_doc_types_chapters'
  validates :name, presence: true
  validates :name, uniqueness: true

  TYPES = [['Grupo Facturas', 'FinancialDocumentBill'], ['Grupo Contratos', 'FinancialDocumentContract'], ['Grupo Otros', 'FinancialDocumentOther']]
end
