class CreateCatAciInstitutionalActivities < ActiveRecord::Migration
  def change
    create_table :cat_aci_institutional_activities do |t|
      t.string :key
      t.text :description
      t.integer :cat_pgd_axi_id
      t.integer :cat_ere_expending_focu_id
      t.integer :cat_ere_result_id
      t.integer :cat_ere_subresult_id
      t.integer :cat_cfu_finality_id
      t.integer :cat_cfu_function_id
      t.integer :cat_cfu_subfunction_id

      t.timestamps null: false
    end
  end
end
