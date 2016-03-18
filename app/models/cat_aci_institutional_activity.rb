class CatAciInstitutionalActivity < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  belongs_to :cat_cfu_subfunction
  belongs_to :cat_cfu_function
  belongs_to :cat_cfu_finality
  belongs_to :cat_ere_subresult
  belongs_to :cat_ere_result
  belongs_to :cat_ere_expending_focu
  belongs_to :cat_pgd_axi

  validates :key, :description, :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, presence: true
  validates :description, uniqueness: true

  def self.find_by_key_and_clasificacion_funcional(key, finality, function, subfunction)

    ais = where(key: key,
                cat_cfu_finality_id: CatCfuFinality.find_by_key(finality).try(:id),
                cat_cfu_function_id: CatCfuFunction.find_by_key(function).try(:id),
                cat_cfu_subfunction: CatCfuSubfunction.find_by_key(subfunction).try(:id)
          )
    if ais && ais.size > 1
      raise "Hay más de una Actividad institucional con la key: #{key}, finalidad: #{finality}, funcion: #{function}, subfuncion: #{subfunction}"
    else
      ais ? ais.first : nil
    end
  end
end
