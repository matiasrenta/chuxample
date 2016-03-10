class CreateCatFonFundingSources < ActiveRecord::Migration
  def change
    create_table :cat_fon_funding_sources do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
