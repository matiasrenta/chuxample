class CatPgdGoal < ActiveRecord::Base
  belongs_to :cat_pgd_objective

  validates :key, :description, :cat_pgd_objective_id, presence: true
  validates :key, uniqueness: true
end
