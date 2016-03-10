class CatGenStrategy < ActiveRecord::Base
  has_many :cat_gen_goals, dependent: :restrict_with_error
  belongs_to :cat_gen_objective

  validates :key, :description, :cat_gen_objective_id, presence: true
  validates :key, uniqueness: true
end
