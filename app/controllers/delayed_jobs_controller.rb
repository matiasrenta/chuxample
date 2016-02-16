class DelayedJobsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :delayed_job_params

  # GET /delayed_jobs
  def index
    @delayed_jobs = do_index(DelayedJob, params)
  end

  # GET /delayed_jobs/1
  def show
  end

  # DELETE /delayed_jobs/1
  def destroy
    @delayed_job.destroy
    redirect_to delayed_jobs_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def delayed_job_params
      params.require(:delayed_job).permit(:priority, :attempts, :handler, :last_error, :run_at, :locked_at, :failed_at, :locked_by, :queue)
    end
end
