class RemoveOldForeignKeysFromGenModels < ActiveRecord::Migration
  def change
    remove_column :cat_gen_strategies, :cat_gen_objective_id, :integer
    remove_column :cat_gen_line_of_actions, :cat_gen_goal_id, :integer
  end
end
