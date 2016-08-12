class AddNameToSocialUsers < ActiveRecord::Migration
  def change
    add_column :social_users, :name, :string
  end
end
