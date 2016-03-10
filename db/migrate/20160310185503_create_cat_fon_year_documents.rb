class CreateCatFonYearDocuments < ActiveRecord::Migration
  def change
    create_table :cat_fon_year_documents do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
