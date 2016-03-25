class AddProjectTypeToKeyAnalitivals < ActiveRecord::Migration
  def change
    add_column :key_analyticals, :project_type, :string
  end
end
