class AddNameToProjectActivitySocialAndNomina < ActiveRecord::Migration
  def change
    add_column :project_activity_nominas, :name, :string
    add_column :project_activity_socials, :name, :string
  end
end
