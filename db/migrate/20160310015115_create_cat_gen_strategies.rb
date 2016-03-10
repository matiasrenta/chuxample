class CreateCatGenStrategies < ActiveRecord::Migration
  def change
    create_table :cat_gen_strategies do |t|
      t.string :key
      t.text :description
      t.integer :cat_gen_objective_id

      t.timestamps null: false
    end
  end
end
