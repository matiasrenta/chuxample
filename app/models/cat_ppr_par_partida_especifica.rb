class CatPprParPartidaEspecifica < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :nomina_document_items, dependent: :restrict_with_error
  belongs_to :cat_ppr_par_partida_generica

  validates :key, :description, :cat_ppr_par_partida_generica_id, presence: true
  #validates :key, :description, uniqueness: true
  validates :key, uniqueness: true

  scope :for_nomina, ->{ joins(cat_ppr_par_partida_generica: {cat_ppr_par_concept: [:cat_ppr_par_chapter]}).where('cat_ppr_par_chapters.key = ?', '1000').order('cat_ppr_par_partida_especificas.key asc') }

  def to_label
    "#{key} - #{description}"
  end
end
