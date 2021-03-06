class CatPprParPartidaGenerica < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_ppr_par_partida_especificas, dependent: :restrict_with_error
  belongs_to :cat_ppr_par_concept

  validates :key, :description, :cat_ppr_par_concept_id, presence: true
  #validates :key, :description, uniqueness: true
  validates :key, uniqueness: true
end
