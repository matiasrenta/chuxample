class ModifyFieldsInVerifications < ActiveRecord::Migration
  def change
    remove_column :verifications, :question
    remove_column :verifications, :status

    add_column :verifications, :answer, :integer
    add_column :verifications, :status, :integer, {default: -1}
  end
end
