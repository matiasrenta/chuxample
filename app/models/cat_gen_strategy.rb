class CatGenStrategy < ActiveRecord::Base
  belongs_to :cat_gen_objective

  validates :key, :description, :cat_gen_objective_id, presence: true
  validates :key, uniqueness: true
end
