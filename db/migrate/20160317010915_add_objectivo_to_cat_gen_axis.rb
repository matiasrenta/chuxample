class AddObjectivoToCatGenAxis < ActiveRecord::Migration
  def change
    add_column :cat_gen_axis, :objetivo, :text
  end
end
