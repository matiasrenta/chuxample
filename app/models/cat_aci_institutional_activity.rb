class CatAciInstitutionalActivity < ActiveRecord::Base
  belongs_to :cat_cfu_subfunction
  belongs_to :cat_cfu_function
  belongs_to :cat_cfu_finality
  belongs_to :cat_ere_subresult
  belongs_to :cat_ere_result
  belongs_to :cat_ere_expending_focu
  belongs_to :cat_pgd_axi

  validates :key, :description, :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, presence: true
  validates :description, uniqueness: true
end
