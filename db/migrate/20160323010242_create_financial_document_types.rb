class CreateFinancialDocumentTypes < ActiveRecord::Migration
  def change
    create_table :financial_document_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
