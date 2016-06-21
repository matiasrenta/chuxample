class AddStatusToKeyAnalyticals < ActiveRecord::Migration
  def change
    add_column :key_analyticals, :status, :string
  end
end
