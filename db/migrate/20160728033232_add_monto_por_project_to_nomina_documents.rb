class AddMontoPorProjectToNominaDocuments < ActiveRecord::Migration
  def change
    add_column :nomina_documents, :monto_por_project, :text
  end
end
