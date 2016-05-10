class KeyAnalyticalsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :key_analytical_params

  # GET /key_analyticals
  def index
    @key_analyticals = do_index(KeyAnalytical, params)
  end

  # GET /key_analyticals/1
  def show
  end

  # GET /key_analyticals/new
  def new
  end

  # GET /key_analyticals/1/edit
  def edit
  end

  # POST /key_analyticals
  def create

    if @key_analytical.save
      redirect_to @key_analytical.becomes(KeyAnalytical), notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@key_analytical)
      render :new
    end
  end

  # PATCH/PUT /key_analyticals/1
  def update
    if @key_analytical.update(key_analytical_params)
      redirect_to @key_analytical.becomes(KeyAnalytical), notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@key_analytical)
      render :edit
    end
  end

  # DELETE /key_analyticals/1
  def destroy
    if @key_analytical.destroy
      redirect_to key_analyticals_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@key_analytical)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_analytical_params
      params.require(:key_analytical).permit(:cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :year, :sector, :subsector, :unidad_responsable, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, :cat_fon_fund_id, :cat_ppr_par_chapter_id, :cat_ppr_par_concept_id, :cat_ppr_par_partida_generica_id, :cat_ppr_par_partida_especifica_id, :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :proyecto_de_inversion, :cat_are_area_id, :autorizado, :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre, :cat_uni_measure_unit_id, :meta_fisica, :descripcion_de_las_acciones, :domicilio_del_area, :dut_de_la_accion, :poblacion_beneficiada, :cat_der_human_right_id, :cat_der_strategy_id, :cat_der_line_of_action_id, :justificacion, :porcentaje_igualdad_sustantiva, :mujeres, :hombres, :cat_gen_axi_id, :cat_gen_objective_id, :cat_gen_strategy_id, :cat_gen_goal_id, :cat_gen_line_of_action_id, :cat_pgd_area_of_opportunity_id, :cat_pgd_objective_id, :cat_pgd_goal_id, :cat_pgd_line_of_action_id)
    end
end
