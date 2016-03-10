class CatGenGoal < ActiveRecord::Base
  has_many :cat_gen_line_of_actions, dependent: :restrict_with_error
  belongs_to :cat_gen_strategy

  validates :key, :description, :cat_gen_strategy_id, presence: true
  validates :key, uniqueness: true
end
