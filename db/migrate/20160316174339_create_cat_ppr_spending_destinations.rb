class CreateCatPprSpendingDestinations < ActiveRecord::Migration
  def change
    create_table :cat_ppr_spending_destinations do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
