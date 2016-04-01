class CreateCatDerHumanRights < ActiveRecord::Migration
  def change
    create_table :cat_der_human_rights do |t|
      t.string :key
      t.text :description

      t.timestamps null: false
    end
  end
end
