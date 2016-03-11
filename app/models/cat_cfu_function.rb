class CatCfuFunction < ActiveRecord::Base
  has_many :cat_aci_institutional_activities, dependent: :restrict_with_error
  has_many :cat_cfu_subfunctions, dependent: :restrict_with_error
  belongs_to :cat_cfu_finality

  validates :key, :description, :cat_cfu_finality_id, presence: true
  validates :key, :description, uniqueness: true
end
