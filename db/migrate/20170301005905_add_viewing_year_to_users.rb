class AddViewingYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :viewing_year, :integer
  end
end
