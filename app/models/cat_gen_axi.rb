class CatGenAxi < ActiveRecord::Base
  has_many :cat_gen_objectives, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
