class KeyAnalyticalsController < ApplicationController
  require 'will_paginate/array'
  load_and_authorize_resource except: :index, param_method: :key_analytical_params

  # GET /key_analyticals
  def index
    authorize!(:read, KeyAnalytical)
    params[:destroyed_in] = nil if params[:search_clear] # debo limpiar este filtro a mano
    project_type_filter_for_ejecutors # para filtrar por project_type automaticamente si es un ejecutor específico
    search_algoritm(:q)
    # filtros add-hoc
    if params[:destroyed_in] == 'Solo eliminados'
      @filter_active = true;
      params[:q] = nil # para limpiar todos los otros filtros y no cree confusión al usuario
      flash[:warning] = 'Se muestran todos los proyectos eliminados. No se puede aplicar otro filtro cuando se muestran los eliminados'
      flash.discard(:warning) # elimina esta entrada del flash al finalizar el action
      @key_analyticals = []
      versions_destroyeds.each do |version|
        @key_analyticals << PaperTrail::Version.find(version.max_id).reify
      end
      @key_analyticals = WillPaginate::Collection.create(params[:page] || 1, per_page(params[:per_page]), @key_analyticals.length) do |pager|
        pager.replace @key_analyticals
      end
      @q = KeyAnalytical.accessible_by(current_ability, :read).ransack(params[:q]) # solo para que no de error el search_for
    else
      params[:q][:status_in] = KeyAnalytical.status_array if params[:q] && params[:q][:status_in] == 'Todos'
      if params[:q] && params[:q][:id_in] == 'Sí'
        params[:q][:id_in] = with_history.size > 0 ? with_history : [0]
      elsif params[:q] && params[:q][:id_in] == 'No'
        params[:q][:id_not_in] = with_history.size > 0 ? with_history : [0]
        params[:q].except!(:id_in)
      end
      @q = KeyAnalytical.accessible_by(current_ability, :read).ransack(params[:q])
      @q = @q.order("updated_at DESC, created_at DESC") if params[:q] && params[:q][:meta_sort]
      @key_analyticals = @q.result(distinct: true).paginate(:page => params[:page], :per_page => per_page(params[:per_page]))

      # parche para que el dropdown del filtro tenga el valor que el usuario seleccionó
      @patch_q_id_in = 'Sí' if params[:q] && params[:q][:id_in].present?
      @patch_q_id_in = 'No' if params[:q] && params[:q][:id_not_in].present?
    end
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
    @key_analytical.attributes = key_analytical_params
    status = @key_analytical.modificado_changed? ? KeyAnalytical.status_array[0] : KeyAnalytical.status_array[1]
    if @key_analytical.changed?
      if @key_analytical.save
        logica_afectaciones(status) # logica de afectaciones, modificaciones y eliminaciones
        flash[:info] = 'Cambios sujetos a aprobación. Una vez aprobados se harán efectivos.'
        redirect_to @key_analytical.becomes(KeyAnalytical)
      else
        generate_flash_msg_no_keep(@key_analytical)
        render :edit
      end
    else
      redirect_to @key_analytical.becomes(KeyAnalytical)
    end
  end

  # DELETE /key_analyticals/1
  def destroy
    if @key_analytical.destroy
      logica_afectaciones(KeyAnalytical.status_array[2])
      flash[:info] = 'Eliminación sujeta a aprobación. Una vez aprobada se hará efectiva.'
      redirect_to @key_analytical.becomes(KeyAnalytical)
    else
      generate_flash_msg(@key_analytical)
      redirect_to :back
    end
  end

  def approve_changes
    status = @key_analytical.status
    if @key_analytical.status == KeyAnalytical.status_array[2]
      @key_analytical.versions.last.destroy # aqui estoy eliminando una version que tiene como evento 'create'
      # primero creo el public activity y luego elimino (no me deja hacerlo al revés)
      @key_analytical.create_activity(key: 'key_analytical.approve_reject_afectacion', owner: current_user, parameters: {model_label: @key_analytical.short_key_analytical_string, status: status, approve_or_reject: 'Aprobó'})
      @key_analytical.destroy
      redirect_to key_analyticals_path, notice: t("simple_form.flash.successfully_destroyed")
    else
      @key_analytical = @key_analytical.versions.last.reify
      @key_analytical.versions.last.destroy
      @key_analytical.status = nil
      if @key_analytical.save
        @key_analytical.create_activity(key: 'key_analytical.approve_reject_afectacion', owner: current_user, parameters: {model_label: @key_analytical.short_key_analytical_string, status: status, approve_or_reject: 'Aprobó'})
      end
      redirect_to @key_analytical.becomes(KeyAnalytical), notice: t("simple_form.flash.successfully_updated")
    end
  end

  def reject_changes
    @key_analytical.versions.last.destroy
    status = @key_analytical.status
    @key_analytical.status = nil
    if @key_analytical.save # no genera ninguna version porque solo he cambiado el status (el cual es ignorado)
      @key_analytical.create_activity(key: 'key_analytical.approve_reject_afectacion', owner: current_user, parameters: {model_label: @key_analytical.short_key_analytical_string, status: status, approve_or_reject: 'Rechazó'})
    end
    redirect_to @key_analytical.becomes(KeyAnalytical), notice: 'Los cambios se han rechazado'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_analytical_params
      params.require(:key_analytical).permit(:cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :year, :sector, :subsector, :unidad_responsable, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id, :cat_aci_institutional_activity_id, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, :cat_fon_fund_id, :cat_ppr_par_chapter_id, :cat_ppr_par_concept_id, :cat_ppr_par_partida_generica_id, :cat_ppr_par_partida_especifica_id, :cat_ppr_expense_type_id, :cat_ppr_digit_identifier_id, :cat_ppr_spending_destination_id, :proyecto_de_inversion, :cat_are_area_id, :modificado, :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre, :cat_uni_measure_unit_id, :meta_fisica, :descripcion_de_las_acciones, :domicilio_del_area, :dut_de_la_accion, :poblacion_beneficiada, :cat_der_human_right_id, :cat_der_strategy_id, :cat_der_line_of_action_id, :justificacion, :porcentaje_igualdad_sustantiva, :mujeres, :hombres, :cat_gen_axi_id, :cat_gen_objective_id, :cat_gen_strategy_id, :cat_gen_goal_id, :cat_gen_line_of_action_id, :cat_pgd_area_of_opportunity_id, :cat_pgd_objective_id, :cat_pgd_goal_id, :cat_pgd_line_of_action_id)
    end

    def logica_afectaciones(status)
      @key_analytical = @key_analytical.versions.last.reify # revierto el cambio
      @key_analytical.versions.last.destroy # elimino la version porque he revertido el cambio
      @key_analytical.status = status
      if @key_analytical.save # grabo dejando el record identico a como estaba antes (excepto por el status), pero genero una version con los cambios que el usuario quiere. Esta version es la que se aprueba por el revisor
        # notifico a los revisores
        entity_link = view_context.link_to(@key_analytical.short_key_analytical_string, key_analytical_path(@key_analytical), class: 'display-normal')
        body = "<strong>#{current_user.name_or_email}</strong> realizó una <strong>#{@key_analytical.status}</strong> en el proyecto #{entity_link}"
        Notificator.send(current_user, User.actives.revisores, body, 'fa-money')
        # creo public activity
        @key_analytical.create_activity(key: 'key_analytical.afectacion', owner: current_user, parameters: {model_label: @key_analytical.short_key_analytical_string, status: status})
      end
    end

    def with_history
      @with_history ||= PaperTrail::Version.select(:item_id).group(:item_id).map(&:item_id)
    end

    def versions_destroyeds
      #@destroyeds ||= PaperTrail::Version.select(:id, :item_id).where(event: 'destroy').group(:item_id).map(&:id)
      @destroyeds ||= PaperTrail::Version.select('max(id) as max_id, item_id').where(event: 'destroy').group(:item_id)
    end

    def project_type_filter_for_ejecutors
      if params[:q].nil?
        params[:q] = {}
        params[:q][:project_type_eq] = 'ProjectAdquisicion' if params[:q][:project_type_eq].blank? && current_user.ejecutor_adquisicion?
        params[:q][:project_type_eq] = 'ProjectNomina'      if params[:q][:project_type_eq].blank? && current_user.ejecutor_nomina?
        params[:q][:project_type_eq] = 'ProjectObra'        if params[:q][:project_type_eq].blank? && current_user.ejecutor_obra?
        params[:q][:project_type_eq] = 'ProjectSocial'      if params[:q][:project_type_eq].blank? && current_user.ejecutor_social?
      end
    end
end
