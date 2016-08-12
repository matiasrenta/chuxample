class DeleteUnusedTables < ActiveRecord::Migration
  def change
    drop_table :project_activities
    drop_table :paysheets
    drop_table :project_activity_nominas
  end
end
