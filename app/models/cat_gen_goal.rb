class CatGenGoal < ActiveRecord::Base
  belongs_to :cat_gen_strategy

  validates :key, :description, :cat_gen_strategy_id, presence: true
  validates :key, uniqueness: true
end
