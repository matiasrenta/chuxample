class CatEreResult < ActiveRecord::Base
  belongs_to :cat_ere_expending_focu

  validates :key, :description, :cat_ere_expending_focu_id, presence: true
  validates :key, :description, uniqueness: true
end
