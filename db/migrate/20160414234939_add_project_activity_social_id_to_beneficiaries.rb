class AddProjectActivitySocialIdToBeneficiaries < ActiveRecord::Migration
  def change
    add_column :beneficiaries, :project_activity_social_id, :integer
  end
end
