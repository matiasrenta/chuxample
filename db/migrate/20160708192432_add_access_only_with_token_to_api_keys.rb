class AddAccessOnlyWithTokenToApiKeys < ActiveRecord::Migration
  def change
    add_column :api_keys, :access_only_with_token, :boolean
  end
end
