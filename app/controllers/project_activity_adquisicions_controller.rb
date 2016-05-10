class ProjectActivityAdquisicionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :project_activity_adquisicion_params

  # GET /project_activity_adquisicions
  def index
    @project_activity_adquisicions = do_index(ProjectActivityAdquisicion, params)
  end

  # GET /project_activity_adquisicions/1
  def show
    @key_analytical = @project_activity_adquisicion.project_adquisicion
  end

  # GET /project_activity_adquisicions/new
  def new
    @key_analytical = KeyAnalytical.find(params[:project_id])
  end

  # GET /project_activity_adquisicions/1/edit
  def edit
    @key_analytical = @project_activity_adquisicion.project_adquisicion
  end

  # POST /project_activity_adquisicions
  def create
    @key_analytical = KeyAnalytical.find(params[:project_id])
    @project_activity_adquisicion = @key_analytical.project_activity_adquisicions.build(project_activity_adquisicion_params)
    if @project_activity_adquisicion.save
      redirect_to @project_activity_adquisicion, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@project_activity_adquisicion)
      render :new
    end
  end

  # PATCH/PUT /project_activity_adquisicions/1
  def update
    if @project_activity_adquisicion.update(project_activity_adquisicion_params)
      redirect_to @project_activity_adquisicion, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@project_activity_adquisicion)
      render :edit
    end
  end

  # DELETE /project_activity_adquisicions/1
  def destroy
    if @project_activity_adquisicion.destroy
      redirect_to project_path(@project_activity_adquisicion.project_adquisicion), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@project_activity_adquisicion)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def project_activity_adquisicion_params
      params.require(:project_activity_adquisicion).permit(:name, :description, :calle, :nro_exterior, :nro_interior, :colonia, :codigo_postal, :tipo_adquisicion, :cantidad, :avance_programado, :avance_real, :real_start_date, :real_end_date, :project_adquisicion_id)
    end
end
