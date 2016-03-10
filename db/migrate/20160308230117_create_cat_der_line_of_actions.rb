class CreateCatDerLineOfActions < ActiveRecord::Migration
  def change
    create_table :cat_der_line_of_actions do |t|
      t.string :key
      t.text :description
      t.integer :cat_der_strategy_id

      t.timestamps null: false
    end
  end
end
