class ProjectsController < ApplicationController
  #load_and_authorize_resource except: :index, param_method: :key_analytical_params

  def index
    @projects_obra = do_index(ProjectObra, params, nil, true, nil, nil, :q_obra)
    @projects_cultura = do_index(ProjectCultura, params, nil, true, nil, nil, :q_cultura)
    @projects_administracion = do_index(ProjectAdministracion, params, nil, true, nil, nil, :q_administracion)
  end

  def show
    @key_analytical = KeyAnalytical.find(params[:id])
    authorize! :read, @key_analytical.class
    if @key_analytical.obra?
      @project_activity_obras = do_index(ProjectActivityObra, params)
    elsif @key_analytical.administracion?
      #@project_activity_administracion = do_index(ProjectActivityAdministracion, params)
    elsif @key_analytical.cultura?
      #@project_activity_administracion = do_index(ProjectActivityAdministracion, params)
    else
      raise "Tipo de proyecto inexistente"
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def key_analytical_params
    params.require(:key_analytical).permit(:cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :year, :sector, :subsector, :unidad_responsable, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, :cat_fon_fund_id, :cat_ppr_par_chapter_id, :cat_ppr_par_concept_id, :cat_ppr_par_partida_generica_id, :cat_ppr_par_partida_especifica_id, :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :proyecto_de_inversion, :cat_are_area_id, :autorizado, :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre, :cat_uni_measure_unit_id, :meta_fisica, :descripcion_de_las_acciones, :domicilio_del_area, :dut_de_la_accion, :poblacion_beneficiada, :cat_der_human_right_id, :cat_der_strategy_id, :cat_der_line_of_action_id, :justificacion, :porcentaje_igualdad_sustantiva, :mujeres, :hombres, :cat_gen_axi_id, :cat_gen_objective_id, :cat_gen_strategy_id, :cat_gen_goal_id, :cat_gen_line_of_action_id, :cat_pgd_area_of_opportunity_id, :cat_pgd_objective_id, :cat_pgd_goal_id, :cat_pgd_line_of_action_id)
  end
end
