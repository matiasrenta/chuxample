class CreateKeyMetaCategories < ActiveRecord::Migration
  def change
    create_table :key_meta_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
