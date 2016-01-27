class AddThingCategoryIdToThings < ActiveRecord::Migration
  def change
    add_column :things, :thing_category_id, :integer
  end
end
