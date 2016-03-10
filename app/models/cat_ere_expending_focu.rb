class CatEreExpendingFocu < ActiveRecord::Base
  has_many :cat_ere_results, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, :description, uniqueness: true
end
