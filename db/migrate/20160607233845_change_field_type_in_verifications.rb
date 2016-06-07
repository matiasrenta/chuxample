class ChangeFieldTypeInVerifications < ActiveRecord::Migration
  def change
    remove_column :verifications, :verification_owneable_type, :integer
    add_column :verifications, :verification_owneable_type, :string
  end
end
