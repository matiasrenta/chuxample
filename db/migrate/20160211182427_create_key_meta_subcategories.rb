class CreateKeyMetaSubcategories < ActiveRecord::Migration
  def change
    create_table :key_meta_subcategories do |t|
      t.string :name
      t.integer :key_meta_category_id

      t.timestamps null: false
    end
  end
end
