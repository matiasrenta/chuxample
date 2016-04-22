class CreateProjectActivityNominas < ActiveRecord::Migration
  def change
    create_table :project_activity_nominas do |t|
      t.integer :nro_trabajadores
      t.string :mes
      t.text :comentarios
      t.integer :ascription_id
      t.integer :project_nomina_id

      t.timestamps null: false
    end
  end
end
