class CatCfuFunction < ActiveRecord::Base
  belongs_to :cat_cfu_finality

  validates :key, :description, :cat_cfu_finality_id, presence: true
  validates :key, :description, uniqueness: true
end
