class CreateProjectActivitySocials < ActiveRecord::Migration
  def change
    create_table :project_activity_socials do |t|
      t.integer :social_development_program_id
      t.text :comentarios
      t.integer :nro_beneficiarios
      t.integer :nro_metas_cumplidas
      t.date :fecha_inicio_real
      t.date :fecha_fin_real
      t.integer :project_social_id

      t.timestamps null: false
    end
  end
end
