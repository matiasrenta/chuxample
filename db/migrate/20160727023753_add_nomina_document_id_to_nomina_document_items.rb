class AddNominaDocumentIdToNominaDocumentItems < ActiveRecord::Migration
  def change
    add_column :nomina_document_items, :nomina_document_id, :integer
  end
end
