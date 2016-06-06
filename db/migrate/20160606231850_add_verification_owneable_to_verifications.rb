class AddVerificationOwneableToVerifications < ActiveRecord::Migration
  def change
    remove_column :verifications, :user_id, :integer
    add_column :verifications, :verification_owneable_id, :integer
    add_column :verifications, :verification_owneable_type, :integer
  end
end
