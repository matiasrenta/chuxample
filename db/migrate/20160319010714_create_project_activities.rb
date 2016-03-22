class CreateProjectActivities < ActiveRecord::Migration
  def change
    create_table :project_activities do |t|
      t.string :key
      t.string :name
      t.text :description
      t.integer :key_analytical_id

      t.timestamps null: false
    end
  end
end
