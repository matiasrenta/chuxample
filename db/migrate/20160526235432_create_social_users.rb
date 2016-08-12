class CreateSocialUsers < ActiveRecord::Migration
  def change
    create_table :social_users do |t|
      t.string :provider
      t.integer :uid
      t.string :access_token
      t.string :email
      t.string :json_data

      t.timestamps null: false
    end
  end
end
