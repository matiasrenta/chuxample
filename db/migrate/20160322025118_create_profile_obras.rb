class CreateProfileObras < ActiveRecord::Migration
  def change
    create_table :profile_obras do |t|
      t.string :contrato
      t.string :calle
      t.string :numero
      t.string :colonia
      t.string :codigo_postal
      t.string :tipo_obra
      t.integer :cantidad
      t.float :importe
      t.date :fecha_inicio
      t.date :fecha_fin
      t.float :avance_programado
      t.float :avance_real

      t.timestamps null: false
    end
  end
end
