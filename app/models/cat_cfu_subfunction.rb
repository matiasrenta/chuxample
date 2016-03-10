class CatCfuSubfunction < ActiveRecord::Base
  belongs_to :cat_cfu_function

  validates :key, :description, :cat_cfu_function_id, presence: true
  validates :key, :description, uniqueness: true
end
