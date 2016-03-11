class CatCfuFinality < ActiveRecord::Base
  has_many :cat_aci_institutional_activities, dependent: :restrict_with_error
  has_many :cat_cfu_functions, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, :description, uniqueness: true
end
