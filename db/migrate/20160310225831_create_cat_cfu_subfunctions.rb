class CreateCatCfuSubfunctions < ActiveRecord::Migration
  def change
    create_table :cat_cfu_subfunctions do |t|
      t.string :key
      t.text :description
      t.integer :cat_cfu_function_id

      t.timestamps null: false
    end
  end
end
