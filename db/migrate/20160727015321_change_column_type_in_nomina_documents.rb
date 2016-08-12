class ChangeColumnTypeInNominaDocuments < ActiveRecord::Migration
  def change
    remove_column :nomina_documents, :file_size
    add_column :nomina_documents, :file_size, :integer
  end
end
