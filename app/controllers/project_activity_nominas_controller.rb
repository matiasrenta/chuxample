class ProjectActivityNominasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :project_activity_nomina_params

  # GET /project_activity_nominas
  def index
    @project_activity_nominas = do_index(ProjectActivityNomina, params)
  end

  # GET /project_activity_nominas/1
  def show
    @key_analytical = @project_activity_nomina.project_nomina
    @paysheets = do_index(Paysheet, params, @project_activity_nomina.paysheets)
  end

  # GET /project_activity_nominas/new
  def new
    @key_analytical = KeyAnalytical.find(params[:project_id])
  end

  # GET /project_activity_nominas/1/edit
  def edit
    @key_analytical = @project_activity_nomina.project_nomina
  end

  # POST /project_activity_nominas
  def create
    @key_analytical = KeyAnalytical.find(params[:project_id])
    @project_activity_nomina = @key_analytical.project_activity_nominas.build(project_activity_nomina_params)
    if @project_activity_nomina.save
      redirect_to @project_activity_nomina, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@project_activity_nomina)
      render :new
    end
  end

  # PATCH/PUT /project_activity_nominas/1
  def update
    if @project_activity_nomina.update(project_activity_nomina_params)
      redirect_to @project_activity_nomina, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@project_activity_nomina)
      render :edit
    end
  end

  # DELETE /project_activity_nominas/1
  def destroy
    if @project_activity_nomina.destroy
      redirect_to project_path(@project_activity_nomina.project_nomina), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@project_activity_nomina)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def project_activity_nomina_params
      params.require(:project_activity_nomina).permit(:nro_trabajadores, :mes, :comentarios, :ascription_id, :project_nomina_id)
    end
end
