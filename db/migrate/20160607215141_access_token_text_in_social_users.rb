class AccessTokenTextInSocialUsers < ActiveRecord::Migration
  def change
    remove_column :social_users, :access_token, :string
    add_column :social_users, :access_token, :text

    remove_column :social_users, :json_data, :string
    add_column :social_users, :json_data, :text
  end
end
