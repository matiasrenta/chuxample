class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :nombres
      t.string :sexo
      t.date :fecha_nacimiento
      t.boolean :indefinido
      t.date :periodo_desde
      t.date :periodo_hasta
      t.integer :job_title_id
      t.integer :ascription_id
      t.float :anios_residencia_en_df
      t.text :domicilio
      t.text :ocupacion
      t.string :nombre_padre
      t.string :nombre_madre
      t.string :curp
      t.float :importe_actual

      t.timestamps null: false
    end
  end
end
