class CatPgdLineOfAction < ActiveRecord::Base
  belongs_to :cat_pgd_goal

  validates :key, :description, :cat_pgd_goal_id, presence: true
  validates :key, uniqueness: true
end
