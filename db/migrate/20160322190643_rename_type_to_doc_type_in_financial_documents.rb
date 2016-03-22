class RenameTypeToDocTypeInFinancialDocuments < ActiveRecord::Migration
  def change
    rename_column :financial_documents, :type, :doc_type
  end
end
