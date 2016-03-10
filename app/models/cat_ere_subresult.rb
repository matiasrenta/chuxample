class CatEreSubresult < ActiveRecord::Base
  belongs_to :cat_ere_result

  validates :key, :description, :cat_ere_result_id, presence: true
  validates :key, :description, uniqueness: true
end
