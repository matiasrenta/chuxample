class CreateCatUniMeasureUnits < ActiveRecord::Migration
  def change
    create_table :cat_uni_measure_units do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
