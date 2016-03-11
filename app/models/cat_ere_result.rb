class CatEreResult < ActiveRecord::Base
  has_many :cat_aci_institutional_activities, dependent: :restrict_with_error
  has_many :cat_ere_subresults, dependent: :restrict_with_error
  belongs_to :cat_ere_expending_focu

  validates :key, :description, :cat_ere_expending_focu_id, presence: true
  validates :key, :description, uniqueness: true
end
