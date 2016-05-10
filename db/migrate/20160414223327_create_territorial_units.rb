class CreateTerritorialUnits < ActiveRecord::Migration
  def change
    create_table :territorial_units do |t|
      t.string :code
      t.string :name
      t.string :grado_marginacion

      t.timestamps null: false
    end
  end
end
