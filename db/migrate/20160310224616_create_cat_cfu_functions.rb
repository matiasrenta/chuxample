class CreateCatCfuFunctions < ActiveRecord::Migration
  def change
    create_table :cat_cfu_functions do |t|
      t.string :key
      t.text :description
      t.integer :cat_cfu_finality_id

      t.timestamps null: false
    end
  end
end
