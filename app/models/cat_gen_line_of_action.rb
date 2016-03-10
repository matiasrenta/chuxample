class CatGenLineOfAction < ActiveRecord::Base
  belongs_to :cat_gen_goal

  validates :key, :description, :cat_gen_goal_id, presence: true
  validates :key, uniqueness: true
end
