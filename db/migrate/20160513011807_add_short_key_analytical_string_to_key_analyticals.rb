class AddShortKeyAnalyticalStringToKeyAnalyticals < ActiveRecord::Migration
  def change
    add_column :key_analyticals, :short_key_analytical_string, :string
  end
end
