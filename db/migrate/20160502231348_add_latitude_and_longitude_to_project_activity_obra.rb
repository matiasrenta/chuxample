class AddLatitudeAndLongitudeToProjectActivityObra < ActiveRecord::Migration
  def change
    add_column :project_activity_obras, :latitude, :float
    add_column :project_activity_obras, :longitude, :float
  end
end
