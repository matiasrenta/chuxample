class CreateVerificationPhotos < ActiveRecord::Migration
  def change
    create_table :verification_photos do |t|
      t.integer :verification_id
      t.string :url
      t.datetime :date_and_time

      t.timestamps null: false
    end
  end
end
