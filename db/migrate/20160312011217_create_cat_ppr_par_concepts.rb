class CreateCatPprParConcepts < ActiveRecord::Migration
  def change
    create_table :cat_ppr_par_concepts do |t|
      t.string :key
      t.text :description
      t.integer :cat_ppr_par_chapter_id

      t.timestamps null: false
    end
  end
end
