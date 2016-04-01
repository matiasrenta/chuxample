class ChangeColumnInFinancialDocuments < ActiveRecord::Migration
  def change
    rename_column :financial_documents, :contract_id, :financial_document_contract_id
  end
end
