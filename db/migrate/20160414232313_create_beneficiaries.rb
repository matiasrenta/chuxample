class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :nombres
      t.integer :territorial_unit_id
      t.string :sexo
      t.integer :edad
      t.date :fecha_nacimiento
      t.string :lugar_nacimiento
      t.string :pertenencia_etnica
      t.string :grado_maximo_estudios
      t.float :anios_residencia_en_df
      t.text :domicilio
      t.text :ocupacion
      t.string :nombre_padre
      t.string :nombre_madre
      t.string :curp

      t.timestamps null: false
    end
  end
end
