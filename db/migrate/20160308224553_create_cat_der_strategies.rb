class CreateCatDerStrategies < ActiveRecord::Migration
  def change
    create_table :cat_der_strategies do |t|
      t.string :key
      t.text :description
      t.integer :cat_der_human_right_id

      t.timestamps null: false
    end
  end
end
