class CatPprParPartidaEspecifica < ActiveRecord::Base
  belongs_to :cat_ppr_par_partida_generica

  validates :key, :description, :cat_ppr_par_partida_generica_id, presence: true
  validates :key, :description, uniqueness: true
end
