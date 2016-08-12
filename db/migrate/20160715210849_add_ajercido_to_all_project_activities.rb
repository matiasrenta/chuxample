class AddAjercidoToAllProjectActivities < ActiveRecord::Migration
  def change
    add_column :project_activity_adquisicions, :ejercido, :float
    add_column :project_activity_nominas, :ejercido, :float
    add_column :project_activity_obras, :ejercido, :float
    add_column :project_activity_socials, :ejercido, :float
  end
end
