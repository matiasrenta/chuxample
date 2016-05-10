class FinancialDocumentType < ActiveRecord::Base
  has_many :financial_documents, dependent: :restrict_with_error
  has_and_belongs_to_many :chapters, join_table: 'fin_doc_types_chapters'
  validates :name, presence: true
  validates :name, uniqueness: true

  SYS_DOC_TYPES = [[I18n.t('simple_form.labels.defaults.financial_document_bill_group'), 'FinancialDocumentBill'],
                   [I18n.t('simple_form.labels.defaults.financial_document_contract_group'), 'FinancialDocumentContract'],
                   [I18n.t('simple_form.labels.defaults.financial_document_other_group'), 'FinancialDocumentOther']]
end
