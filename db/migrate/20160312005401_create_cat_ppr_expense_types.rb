class CreateCatPprExpenseTypes < ActiveRecord::Migration
  def change
    create_table :cat_ppr_expense_types do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
