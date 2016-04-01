class ChangeFechasInFinancialDocuments < ActiveRecord::Migration
  def change
    remove_column :financial_documents, :fecha_expedicion, :string
    remove_column :financial_documents, :fecha_finalizacion, :string
    add_column :financial_documents, :fecha_expedicion, :date
    add_column :financial_documents, :fecha_finalizacion, :date
  end
end
