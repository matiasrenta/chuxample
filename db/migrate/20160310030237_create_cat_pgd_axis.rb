class CreateCatPgdAxis < ActiveRecord::Migration
  def change
    create_table :cat_pgd_axis do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
