class CreateCatEreSubresults < ActiveRecord::Migration
  def change
    create_table :cat_ere_subresults do |t|
      t.string :key
      t.text :description
      t.integer :cat_ere_result_id

      t.timestamps null: false
    end
  end
end
