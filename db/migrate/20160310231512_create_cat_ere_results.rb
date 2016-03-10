class CreateCatEreResults < ActiveRecord::Migration
  def change
    create_table :cat_ere_results do |t|
      t.string :key
      t.text :description
      t.integer :cat_ere_expending_focu_id

      t.timestamps null: false
    end
  end
end
