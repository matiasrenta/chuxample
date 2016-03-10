class CreateCatPgdAreaOfOpportunities < ActiveRecord::Migration
  def change
    create_table :cat_pgd_area_of_opportunities do |t|
      t.string :key
      t.text :description
      t.integer :cat_pgd_axi_id

      t.timestamps null: false
    end
  end
end
