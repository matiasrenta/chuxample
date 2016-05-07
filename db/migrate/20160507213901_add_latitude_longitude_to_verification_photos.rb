class AddLatitudeLongitudeToVerificationPhotos < ActiveRecord::Migration
  def change
    add_column :verification_photos, :latitude, :float
    add_column :verification_photos, :longitude, :float
  end
end
