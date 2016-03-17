class CatGenLineOfAction < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  belongs_to :cat_gen_strategy

  validates :key, :description, :cat_gen_goal_id, presence: true
  validates :key, uniqueness: true
end
