class CreateCatFonGenericSources < ActiveRecord::Migration
  def change
    create_table :cat_fon_generic_sources do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
