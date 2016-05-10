class ChangeMonthToIntegerInActivityNomina < ActiveRecord::Migration
  def change
    remove_column :project_activity_nominas, :mes, :string
    add_column :project_activity_nominas, :mes, :integer
  end
end
