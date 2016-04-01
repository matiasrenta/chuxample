class CatGenAxi < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_gen_strategies, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
