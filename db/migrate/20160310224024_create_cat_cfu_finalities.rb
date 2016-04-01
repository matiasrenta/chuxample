class CreateCatCfuFinalities < ActiveRecord::Migration
  def change
    create_table :cat_cfu_finalities do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
