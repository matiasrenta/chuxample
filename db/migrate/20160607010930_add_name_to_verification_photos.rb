class AddNameToVerificationPhotos < ActiveRecord::Migration
  def change
    remove_column :verification_photos, :url, :string
    add_column :verification_photos, :name, :string
  end
end
