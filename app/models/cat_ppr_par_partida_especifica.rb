class CatPprParPartidaEspecifica < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :nomina_document_items, dependent: :restrict_with_error
  belongs_to :cat_ppr_par_partida_generica

  validates :key, :description, :cat_ppr_par_partida_generica_id, presence: true
  #validates :key, :description, uniqueness: true
  validates :key, uniqueness: true

  def to_label
    "#{key} - #{description}"
  end
end
