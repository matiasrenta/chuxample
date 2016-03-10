class CatPgdObjective < ActiveRecord::Base
  belongs_to :cat_pgd_area_of_opportunity

  validates :key, :description, :cat_pgd_area_of_opportunity_id, presence: true
  validates :key, uniqueness: true
end
