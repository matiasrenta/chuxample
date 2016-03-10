class CatPgdAxi < ActiveRecord::Base
  has_many :cat_pgd_area_of_opportunities, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
