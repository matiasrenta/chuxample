class CreateProjectActivityAdquisicions < ActiveRecord::Migration
  def change
    create_table :project_activity_adquisicions do |t|
      t.string :name
      t.string :description
      t.string :calle
      t.string :nro_exterior
      t.string :nro_interior
      t.string :colonia
      t.string :codigo_postal
      t.string :tipo_adquisicion
      t.integer :cantidad
      t.float :avance_programado
      t.float :avance_real
      t.date :real_start_date
      t.date :real_end_date
      t.integer :project_adquisicion_id

      t.timestamps null: false
    end
  end
end
