class KeyAnalytical < ActiveRecord::Base
  has_paper_trail ignore: [:updated_at, :status, :ejercido]
  include PublicActivity::Model

  belongs_to :cat_pgd_line_of_action
  belongs_to :cat_pgd_goal
  belongs_to :cat_pgd_objective
  belongs_to :cat_pgd_area_of_opportunity
  belongs_to :cat_gen_line_of_action
  belongs_to :cat_gen_strategy
  belongs_to :cat_gen_axi
  belongs_to :cat_der_line_of_action
  belongs_to :cat_der_strategy
  belongs_to :cat_der_human_right
  belongs_to :cat_uni_measure_unit
  belongs_to :cat_are_area
  belongs_to :cat_ppr_spending_destination
  belongs_to :cat_ppr_expense_type
  belongs_to :cat_ppr_digit_identifier
  belongs_to :cat_ppr_par_partida_especifica
  belongs_to :cat_ppr_par_partida_generica
  belongs_to :cat_ppr_par_concept
  belongs_to :cat_ppr_par_chapter
  belongs_to :cat_fon_fund
  belongs_to :cat_fon_origin_resource
  belongs_to :cat_fon_year_document
  belongs_to :cat_fon_specific_source
  belongs_to :cat_fon_generic_source
  belongs_to :cat_fon_funding_source
  belongs_to :cat_aci_institutional_activity
  belongs_to :cat_cfu_subfunction
  belongs_to :cat_cfu_function
  belongs_to :cat_cfu_finality
  belongs_to :cat_ere_subresult
  belongs_to :cat_ere_result
  belongs_to :cat_ere_expending_focu
  belongs_to :cat_pgd_axi

  #validates :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :year, :sector, :subsector, :unidad_responsable,
  #          :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id,
  #          :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, :cat_fon_fund_id,
  #          :cat_ppr_par_chapter_id, :cat_ppr_par_concept_id, :cat_ppr_par_partida_generica_id, :cat_ppr_par_partida_especifica_id,
  #          :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :cat_are_area_id, :modificado,
  #          :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre,
  #          :cat_uni_measure_unit_id, :meta_fisica, :cat_der_human_right_id, :cat_der_strategy_id, :cat_der_line_of_action_id,
  #          :justificacion_derechos_humanos, :porcentaje_igualdad_sustantiva, :cat_gen_axi_id, :cat_gen_strategy_id,
  #          :justificacion_genero, presence: true

  normalize_attribute :proyecto_de_inversion # para que no cambie de nil a ''. ver gem attribute_normalizer

  validates :year, :sector, :subsector, :unidad_responsable,
            :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id,
            :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id,
            :cat_ppr_par_partida_especifica_id,
            :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :cat_are_area_id, :original, :modificado,
            :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id,
            :cat_ppr_par_chapter_id,
            presence: true

  #validates :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :year, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, :cat_fon_fund_id, :cat_ppr_par_chapter_id, :cat_ppr_par_concept_id, :cat_ppr_par_partida_generica_id, :cat_ppr_par_partida_especifica_id, :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :cat_are_area_id, :original, :modificado, :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre, :cat_uni_measure_unit_id, :meta_fisica, :cat_der_human_right_id, :cat_der_strategy_id, :cat_der_line_of_action_id, :porcentaje_igualdad_sustantiva, :cat_gen_axi_id, :cat_gen_strategy_id, numericality: true
  validates :poblacion_beneficiada, numericality: true, :if => :poblacion_beneficiada
  validates :mujeres, numericality: true, :if => :mujeres
  validates :hombres, numericality: true, :if => :hombres

  MONTH_FIELDS = %W(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)

  before_save :construct_key_analytical_string, :assign_project_type

  scope :obras, -> { where(project_type: 'ProjectObra') }
  scope :socials, -> { where(project_type: 'ProjectSocial') }
  scope :nominas, -> { where(project_type: 'ProjectNomina') }
  scope :adquisicions, -> { where(project_type: 'ProjectAdquisicion') }
  scope :con_afectaciones, -> {where(id: PaperTrail::Version.select('item_id').group(:item_id).pluck(:item_id))}

  self.inheritance_column = :project_type

  def except_attr_in_public_activity
    [:id, :updated_at, :status]
  end

  def self.project_types
    %w(ProjectObra ProjectSocial ProjectAdquisicion ProjectNomina)
  end

  def self.status_array
    %w(Afectación Modificación Eliminación Todos)
  end

  def programado_calculated
    # la suma de todos los meses hasta el mes anterior empezando desde enero.
    month = 1.month.ago.month
    if month > 1
      programado_total = 0.0
      MONTH_FIELDS.each_with_index do |m, i|
        programado_total = programado_total + eval("self.#{m}.to_f")
        break if (month - 1) == i
      end
      programado_total
    else
      0.0
    end
  end

  def calculate_and_save_ejercido
    # TODO: para los proyectos de nomina hay que sobreescribir este metodo para que sume el prorrateado (se carga el ejercido por partida) que se le asigne cuando el empleado llene el formulario donde carga los tres tipos de documentos comprobatorios de nomina
    project_activities = eval "self.project_activity_#{self.class.name.split('Project').last.pluralize.downcase}"
    self.ejercido = project_activities.sum(:ejercido)
    save
  end

  def obra?
    project_type == "ProjectObra"
  end
  def social?
    project_type == "ProjectSocial"
  end
  def adquisicion?
    project_type == "ProjectAdquisicion"
  end
  def nomina?
    project_type == "ProjectNomina"
  end

  private

  def construct_key_analytical_string
    self.key_analytical_string = "#{construct_short_key_analytical_string}.#{cat_cfu_finality.key}.#{cat_cfu_function.key.split('.')[1]}.#{cat_cfu_subfunction.key.split('.')[2]}.#{cat_aci_institutional_activity.key}.SN.#{cat_fon_funding_source.key}.#{cat_fon_generic_source.key}.#{cat_fon_specific_source.key}.#{cat_fon_year_document.key}.#{cat_fon_origin_resource.key}.#{cat_ppr_par_partida_especifica.key}.#{cat_ppr_expense_type.key}.#{cat_ppr_digit_identifier.key}.#{cat_ppr_spending_destination.key}.#{proyecto_de_inversion}"
  end

  def construct_short_key_analytical_string
    self.short_key_analytical_string = "#{cat_pgd_axi.key}.#{cat_ere_expending_focu.key}.#{cat_ere_result.key.split('.')[1]}.#{cat_ere_subresult.key.split('.')[2]}.#{cat_fon_year_document.key}.#{sector}.#{subsector}.#{unidad_responsable}"
  end
  
  def assign_project_type
    case self.cat_ppr_par_chapter.key
      when '6000'
        self.project_type = 'ProjectObra'
      when '4000'
        self.project_type = 'ProjectSocial'
      when '2000', '3000', '5000'
        self.project_type = 'ProjectAdquisicion'
      when '1000'
        self.project_type = 'ProjectNomina'
      else
        raise "No se pudo asignar un tipo de proyecto. Capítulo no reconocido: #{self.cat_ppr_par_chapter.key}"
    end
  end

end
