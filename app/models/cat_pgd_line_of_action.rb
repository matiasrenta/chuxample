class CatPgdLineOfAction < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  belongs_to :cat_pgd_goal

  validates :key, :description, :cat_pgd_goal_id, presence: true
  validates :key, uniqueness: true
end
