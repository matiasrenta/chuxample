class CreateCatEreExpendingFocus < ActiveRecord::Migration
  def change
    create_table :cat_ere_expending_focus do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
