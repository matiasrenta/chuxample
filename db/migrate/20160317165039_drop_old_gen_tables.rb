class DropOldGenTables < ActiveRecord::Migration
  def change
    drop_table :cat_gen_objectives
    drop_table :cat_gen_goals
  end
end
