class CreateKeyMetaTitles < ActiveRecord::Migration
  def change
    create_table :key_meta_titles do |t|
      t.string :name
      t.string :abbreviation
      t.integer :key_meta_subcategory_id

      t.timestamps null: false
    end
  end
end
