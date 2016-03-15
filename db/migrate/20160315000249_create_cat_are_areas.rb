class CreateCatAreAreas < ActiveRecord::Migration
  def change
    create_table :cat_are_areas do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
