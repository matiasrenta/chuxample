class CatPgdGoal < ActiveRecord::Base
  has_many :cat_pgd_line_of_actions, dependent: :restrict_with_error
  belongs_to :cat_pgd_objective

  validates :key, :description, :cat_pgd_objective_id, presence: true
  validates :key, uniqueness: true
end
