class AddKeyAnalyticalStringToKeyAnalyticals < ActiveRecord::Migration
  def change
    add_column :key_analyticals, :key_analytical_string, :string
  end
end
