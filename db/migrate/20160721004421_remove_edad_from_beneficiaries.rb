class RemoveEdadFromBeneficiaries < ActiveRecord::Migration
  def change
    remove_column :beneficiaries, :edad, :integer
  end
end
