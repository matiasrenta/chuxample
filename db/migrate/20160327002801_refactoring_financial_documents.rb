class RefactoringFinancialDocuments < ActiveRecord::Migration
  def change
    remove_column :financial_documents, :code, :string
    remove_column :financial_documents, :provider, :string
    remove_column :financial_documents, :doc_date, :date
    remove_column :financial_documents, :amount, :float
    remove_column :financial_documents, :project_activity_id, :integer

    add_column :financial_documents, :nro_documento, :string
    add_column :financial_documents, :fecha_expedicion, :string
    add_column :financial_documents, :fecha_finalizacion, :string
    add_column :financial_documents, :monto, :float
    add_column :financial_documents, :supplier_id, :integer
    add_column :financial_documents, :contract_id, :integer
    add_column :financial_documents, :file_id, :string
    add_column :financial_documents, :file_filename, :string
    add_column :financial_documents, :file_size, :integer
    add_column :financial_documents, :file_content_type, :string
    add_column :financial_documents, :type, :string
    add_column :financial_documents, :project_activityable_id, :integer
    add_column :financial_documents, :project_activityable_type, :string
  end
end
