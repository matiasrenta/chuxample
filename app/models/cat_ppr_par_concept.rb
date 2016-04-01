class CatPprParConcept < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_ppr_par_partida_genericas, dependent: :restrict_with_error
  belongs_to :cat_ppr_par_chapter

  validates :key, :description, :cat_ppr_par_chapter_id, presence: true
  validates :key, :description, uniqueness: true
end
