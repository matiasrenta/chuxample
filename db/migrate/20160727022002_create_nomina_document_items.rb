class CreateNominaDocumentItems < ActiveRecord::Migration
  def change
    create_table :nomina_document_items do |t|
      t.integer :cat_ppr_par_partida_especifica_id
      t.float :monto

      t.timestamps null: false
    end
  end
end
