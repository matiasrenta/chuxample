class CatPprParPartidaGenerica < ActiveRecord::Base
  has_many :cat_ppr_par_partida_especificas, dependent: :restrict_with_error
  belongs_to :cat_ppr_par_concept

  validates :key, :description, :cat_ppr_par_concept_id, presence: true
  validates :key, :description, uniqueness: true
end
