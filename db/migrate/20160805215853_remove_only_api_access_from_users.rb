class RemoveOnlyApiAccessFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :only_api_access
  end
end
