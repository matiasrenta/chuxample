class AddFinancialDocumentTypeIdToFinancialDocuments < ActiveRecord::Migration
  def change
    remove_column :financial_documents, :doc_type, :text
    add_column :financial_documents, :financial_document_type_id, :integer
  end
end
