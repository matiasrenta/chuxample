class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.string :abbreviation
      t.integer :state_id

      t.timestamps null: false
    end
  end
end
