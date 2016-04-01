class CreateCatPgdObjectives < ActiveRecord::Migration
  def change
    create_table :cat_pgd_objectives do |t|
      t.string :key
      t.text :description
      t.integer :cat_pgd_area_of_opportunity_id

      t.timestamps null: false
    end
  end
end
