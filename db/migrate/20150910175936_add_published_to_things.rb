class AddPublishedToThings < ActiveRecord::Migration
  def change
    add_column :things, :published, :boolean
  end
end
