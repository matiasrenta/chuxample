class UidLimit8InSocialUsers < ActiveRecord::Migration
  def change
    remove_column :social_users, :uid, :integer
    add_column :social_users, :uid, :integer, limit: 8
  end
end
