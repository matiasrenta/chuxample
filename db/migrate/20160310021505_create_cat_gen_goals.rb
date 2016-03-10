class CreateCatGenGoals < ActiveRecord::Migration
  def change
    create_table :cat_gen_goals do |t|
      t.string :key
      t.text :description
      t.integer :cat_gen_strategy_id

      t.timestamps null: false
    end
  end
end
