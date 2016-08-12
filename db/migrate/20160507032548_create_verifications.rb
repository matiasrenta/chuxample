class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.integer :user_id
      t.integer :project_activity_obra_id
      t.integer :question
      t.integer :evaluation
      t.text :comments
      t.integer :status

      t.timestamps null: false
    end
  end
end
