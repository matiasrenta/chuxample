class CreatePaysheets < ActiveRecord::Migration
  def change
    create_table :paysheets do |t|
      t.integer :staff_id
      t.integer :job_title_id
      t.integer :ascription_id
      t.float :importe
      t.integer :project_activity_nomina_id

      t.timestamps null: false
    end
  end
end
