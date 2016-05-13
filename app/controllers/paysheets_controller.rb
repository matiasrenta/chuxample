class PaysheetsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :paysheet_params
  before_action :set_project_activity_nomina, except: :index

  # GET /paysheets
  def index
    @paysheets = do_index(Paysheet, params)
  end

  # GET /paysheets/1
  def show
  end

  # GET /paysheets/new
  def new
  end

  # GET /paysheets/1/edit
  def edit
  end

  # POST /paysheets
  def create
    @paysheet = @project_activity_nomina.paysheets.build(paysheet_params)
    if @paysheet.save
      redirect_to @paysheet, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@paysheet)
      render :new
    end
  end

  # PATCH/PUT /paysheets/1
  def update
    if @paysheet.update(paysheet_params)
      redirect_to @paysheet, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@paysheet)
      render :edit
    end
  end

  # DELETE /paysheets/1
  def destroy
    if @paysheet.destroy
      redirect_to project_activity_nomina_path(@project_activity_nomina), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@paysheet)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def paysheet_params
      params.require(:paysheet).permit(:staff_id, :job_title_id, :ascription_id, :importe, :project_activity_nomina_id)
    end

  def set_project_activity_nomina
    if @paysheet.try(:id)
      @project_activity_nomina = @paysheet.project_activity_nomina
    else
      @project_activity_nomina = ProjectActivityNomina.find(params[:project_activity_nomina_id])
    end
  end
end
