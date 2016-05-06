class CreateLeyFraccions < ActiveRecord::Migration
  def change
    create_table :ley_fraccions do |t|
      t.string :codigo
      t.string :name
      t.text :descripcion_de_documento
      t.string :periodo_actualizacion
      t.date :actualizado
      t.date :validado
      t.text :detalle
      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type
      t.integer :ley_articulo_id

      t.timestamps null: false
    end
  end
end
