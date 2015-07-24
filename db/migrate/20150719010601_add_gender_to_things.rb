class AddGenderToThings < ActiveRecord::Migration
  def change
    add_column :things, :gender, :string
  end
end
