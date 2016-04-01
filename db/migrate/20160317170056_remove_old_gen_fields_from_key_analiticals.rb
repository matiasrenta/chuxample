class RemoveOldGenFieldsFromKeyAnaliticals < ActiveRecord::Migration
  def change
    remove_column :key_analyticals, :cat_gen_goal_id, :integer
  end
end
