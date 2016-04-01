class CreateCatFonOriginResources < ActiveRecord::Migration
  def change
    create_table :cat_fon_origin_resources do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
