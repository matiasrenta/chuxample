class CreateCatFonFunds < ActiveRecord::Migration
  def change
    create_table :cat_fon_funds do |t|
      t.string :key
      t.text :description
      t.integer :cat_fon_funding_source_id
      t.integer :cat_fon_generic_source_id
      t.integer :cat_fon_specific_source_id
      t.integer :cat_fon_year_document_id
      t.integer :cat_fon_origin_resource_id

      t.timestamps null: false
    end
  end
end
