class AddMetaToCatGenStrategies < ActiveRecord::Migration
  def change
    add_column :cat_gen_strategies, :meta, :text
  end
end
