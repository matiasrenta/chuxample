class CreateCatPgdGoals < ActiveRecord::Migration
  def change
    create_table :cat_pgd_goals do |t|
      t.string :key
      t.text :description
      t.integer :cat_pgd_objective_id

      t.timestamps null: false
    end
  end
end
