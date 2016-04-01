class CreateCatPprDigitIdentifiers < ActiveRecord::Migration
  def change
    create_table :cat_ppr_digit_identifiers do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
