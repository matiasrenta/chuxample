class ProjectActivitySocialsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :project_activity_social_params

  # GET /project_activity_socials
  def index
    @project_activity_socials = indexize(ProjectActivitySocial)
  end

  # GET /project_activity_socials/1
  def show
    @key_analytical = @project_activity_social.project_social
  end

  # GET /project_activity_socials/new
  def new
    @key_analytical = KeyAnalytical.find(params[:project_id])
  end

  # GET /project_activity_socials/1/edit
  def edit
    @key_analytical = @project_activity_social.project_social
  end

  # POST /project_activity_socials
  def create
    @key_analytical = KeyAnalytical.find(params[:project_id])
    @project_activity_social = @key_analytical.project_activity_socials.build(project_activity_social_params)
    if @project_activity_social.save
      redirect_to @project_activity_social, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@project_activity_social)
      render :new
    end
  end

  # PATCH/PUT /project_activity_socials/1
  def update
    if @project_activity_social.update(project_activity_social_params)
      redirect_to @project_activity_social, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@project_activity_social)
      render :edit
    end
  end

  # DELETE /project_activity_socials/1
  def destroy
    if @project_activity_social.destroy
      redirect_to project_path(@project_activity_social.project_social), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@project_activity_social)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def project_activity_social_params
      params.require(:project_activity_social).permit(:social_development_program_id, :comentarios, :nro_beneficiarios, :nro_metas_cumplidas, :fecha_inicio_real, :fecha_fin_real, :project_social_id)
    end
end
