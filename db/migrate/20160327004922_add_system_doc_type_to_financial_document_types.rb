class AddSystemDocTypeToFinancialDocumentTypes < ActiveRecord::Migration
  def change
    add_column :financial_document_types, :system_doc_type, :string
  end
end
