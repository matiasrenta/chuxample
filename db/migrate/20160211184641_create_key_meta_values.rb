class CreateKeyMetaValues < ActiveRecord::Migration
  def change
    create_table :key_meta_values do |t|
      t.string :key_value
      t.string :key_description
      t.integer :key_meta_title_id

      t.timestamps null: false
    end
  end
end
