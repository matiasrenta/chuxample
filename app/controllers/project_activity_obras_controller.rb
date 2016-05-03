class ProjectActivityObrasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :project_activity_obra_params

  # GET /project_activity_obras
  def index
    @project_activity_obras = do_index(ProjectActivityObra, params)
  end

  # GET /project_activity_obras/1
  def show
    @key_analytical = @project_activity_obra.project_obra

    @hash = Gmaps4rails.build_markers([@project_activity_obra]) do |activity_obra, marker|
      marker.lat activity_obra.latitude
      marker.lng activity_obra.longitude
    end
  end

  # GET /project_activity_obras/new
  def new
    @key_analytical = KeyAnalytical.find(params[:project_id])
  end

  # GET /project_activity_obras/1/edit
  def edit
    @key_analytical = @project_activity_obra.project_obra
  end

  # POST /project_activity_obras
  def create
    @key_analytical = KeyAnalytical.find(params[:project_id])
    @project_activity_obra = @key_analytical.project_activity_obras.build(project_activity_obra_params)
    if @project_activity_obra.save
      redirect_to @project_activity_obra, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@project_activity_obra)
      render :new
    end
  end

  # PATCH/PUT /project_activity_obras/1
  def update
    if @project_activity_obra.update(project_activity_obra_params)
      redirect_to @project_activity_obra, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@project_activity_obra)
      render :edit
    end
  end

  # DELETE /project_activity_obras/1
  def destroy
    if @project_activity_obra.destroy
      redirect_to project_path(@project_activity_obra.project_obra), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@project_activity_obra)
      redirect_to :back
    end

  end

  private

    # Only allow a trusted parameter "white list" through.
    def project_activity_obra_params
      params.require(:project_activity_obra).permit(:name, :description, :calle, :nro_exterior, :nro_interior, :colonia, :codigo_postal, :tipo_obra, :cantidad, :avance_programado, :avance_real, :real_start_date, :real_end_date, :project_obra_id)
    end
end
