class CatCfuSubfunction < ActiveRecord::Base
  has_many :cat_aci_institutional_activities, dependent: :restrict_with_error
  belongs_to :cat_cfu_function

  validates :key, :description, :cat_cfu_function_id, presence: true
  validates :key, :description, uniqueness: true
end
