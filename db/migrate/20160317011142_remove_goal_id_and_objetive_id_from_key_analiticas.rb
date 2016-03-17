class RemoveGoalIdAndObjetiveIdFromKeyAnaliticas < ActiveRecord::Migration
  def change
    remove_column :key_analyticals, :cat_gen_objective_id, :integer
  end
end
