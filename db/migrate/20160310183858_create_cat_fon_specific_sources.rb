class CreateCatFonSpecificSources < ActiveRecord::Migration
  def change
    create_table :cat_fon_specific_sources do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
