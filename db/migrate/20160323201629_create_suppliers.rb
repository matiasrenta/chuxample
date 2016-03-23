class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :rfc
      t.string :razon_social
      t.string :name
      t.string :calle
      t.string :nro_exterior
      t.string :nro_interior
      t.string :entre_calles
      t.integer :state_id
      t.integer :town_id
      t.string :codigo_postal
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
