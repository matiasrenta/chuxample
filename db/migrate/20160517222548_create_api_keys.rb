class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :application
      t.string :access_token
      t.text :note

      t.timestamps null: false
    end
  end
end
