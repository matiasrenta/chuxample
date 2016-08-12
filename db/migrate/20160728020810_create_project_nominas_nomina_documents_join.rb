class CreateProjectNominasNominaDocumentsJoin < ActiveRecord::Migration
  def change
    create_table :proj_nominas_nom_docs_joins, id: false do |t|
      t.belongs_to :project_nomina, index: true
      t.belongs_to :nomina_document, index: true
    end
  end
end
