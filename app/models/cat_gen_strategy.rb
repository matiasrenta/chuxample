class CatGenStrategy < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_gen_line_of_actions, dependent: :restrict_with_error
  belongs_to :cat_gen_axi

  validates :key, :description, :cat_gen_objective_id, presence: true
  validates :key, uniqueness: true
end
