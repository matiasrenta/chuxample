class ProjectActivitiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :project_activity_params

  # GET /project_activities
  def index
    @project_activities = do_index(ProjectActivity, params)
  end

  # GET /project_activities/1
  def show
  end

  # GET /project_activities/new
  def new
  end

  # GET /project_activities/1/edit
  def edit
  end

  # POST /project_activities
  def create

    if @project_activity.save
      redirect_to @project_activity, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@project_activity)
      render :new
    end
  end

  # PATCH/PUT /project_activities/1
  def update
    if @project_activity.update(project_activity_params)
      redirect_to @project_activity, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@project_activity)
      render :edit
    end
  end

  # DELETE /project_activities/1
  def destroy
    @project_activity.destroy
    redirect_to project_activities_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def project_activity_params
      params.require(:project_activity).permit(:key, :name, :description, :key_analytical_id)
    end
end
