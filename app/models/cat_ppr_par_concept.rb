class CatPprParConcept < ActiveRecord::Base
  belongs_to :cat_ppr_par_chapter

  validates :key, :description, :cat_ppr_par_chapter_id, presence: true
  validates :key, :description, uniqueness: true
end
