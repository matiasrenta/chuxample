class DropOldKeyTables < ActiveRecord::Migration
  def change
    drop_table :key_meta_values
    drop_table :key_meta_titles
    drop_table :key_meta_subcategories
    drop_table :key_meta_categories
  end
end
