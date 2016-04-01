class CreateFinancialDocuments < ActiveRecord::Migration
  def change
    create_table :financial_documents do |t|
      t.string :type
      t.string :code
      t.string :provider
      t.date :doc_date
      t.float :amount
      t.integer :project_activity_id

      t.timestamps null: false
    end
  end
end
