class JobTitlesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :job_title_params

  # GET /job_titles
  def index
    @job_titles = indexize(JobTitle)
  end

  # GET /job_titles/1
  def show
  end

  # GET /job_titles/new
  def new
  end

  # GET /job_titles/1/edit
  def edit
  end

  # POST /job_titles
  def create

    if @job_title.save
      redirect_to @job_title, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@job_title)
      render :new
    end
  end

  # PATCH/PUT /job_titles/1
  def update
    if @job_title.update(job_title_params)
      redirect_to @job_title, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@job_title)
      render :edit
    end
  end

  # DELETE /job_titles/1
  def destroy
    if @job_title.destroy
      redirect_to job_titles_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@job_title)
      redirect_to job_titles_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def job_title_params
      params.require(:job_title).permit(:name)
    end
end
