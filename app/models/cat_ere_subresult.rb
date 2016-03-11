class CatEreSubresult < ActiveRecord::Base
  has_many :cat_aci_institutional_activities, dependent: :restrict_with_error
  belongs_to :cat_ere_result

  validates :key, :description, :cat_ere_result_id, presence: true
  validates :key, :description, uniqueness: true
end
