class CreateCatPprParPartidaEspecificas < ActiveRecord::Migration
  def change
    create_table :cat_ppr_par_partida_especificas do |t|
      t.string :key
      t.text :description
      t.integer :cat_ppr_par_partida_generica_id

      t.timestamps null: false
    end
  end
end
