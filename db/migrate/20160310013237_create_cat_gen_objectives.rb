class CreateCatGenObjectives < ActiveRecord::Migration
  def change
    create_table :cat_gen_objectives do |t|
      t.string :key
      t.text :description
      t.integer :cat_gen_axi_id

      t.timestamps null: false
    end
  end
end
