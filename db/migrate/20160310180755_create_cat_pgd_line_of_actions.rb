class CreateCatPgdLineOfActions < ActiveRecord::Migration
  def change
    create_table :cat_pgd_line_of_actions do |t|
      t.string :key
      t.text :description
      t.integer :cat_pgd_goal_id

      t.timestamps null: false
    end
  end
end
