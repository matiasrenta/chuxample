class AddDescriptionToFinancialDocuments < ActiveRecord::Migration
  def change
    add_column :financial_documents, :description, :text
  end
end
