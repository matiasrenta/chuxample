class CatPgdObjective < ActiveRecord::Base
  has_many :cat_pgd_goals, dependent: :restrict_with_error
  belongs_to :cat_pgd_area_of_opportunity

  validates :key, :description, :cat_pgd_area_of_opportunity_id, presence: true
  validates :key, uniqueness: true
end
