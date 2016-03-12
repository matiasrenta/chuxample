class CatPprParChapter < ActiveRecord::Base
  has_many :cat_ppr_par_concepts, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, :description, uniqueness: true
end
