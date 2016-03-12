class CreateCatPprParChapters < ActiveRecord::Migration
  def change
    create_table :cat_ppr_par_chapters do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
