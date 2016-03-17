class AddForeingKeysToGenero < ActiveRecord::Migration
  def change
    add_column :cat_gen_strategies, :cat_gen_axi_id, :integer
    add_column :cat_gen_line_of_actions, :cat_gen_strategy_id, :integer
  end
end
