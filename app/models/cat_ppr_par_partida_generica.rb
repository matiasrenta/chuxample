class CatPprParPartidaGenerica < ActiveRecord::Base
  belongs_to :cat_ppr_par_concept

  validates :key, :description, :cat_ppr_par_concept_id, presence: true
  validates :key, :description, uniqueness: true
end
