class CatEreResultsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ere_result_params

  # GET /cat_ere_results
  def index
    @cat_ere_results = do_index(CatEreResult, params)
  end

  # GET /cat_ere_results/1
  def show
  end

  # GET /cat_ere_results/new
  def new
  end

  # GET /cat_ere_results/1/edit
  def edit
  end

  # POST /cat_ere_results
  def create

    if @cat_ere_result.save
      redirect_to @cat_ere_result, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ere_result)
      render :new
    end
  end

  # PATCH/PUT /cat_ere_results/1
  def update
    if @cat_ere_result.update(cat_ere_result_params)
      redirect_to @cat_ere_result, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ere_result)
      render :edit
    end
  end

  # DELETE /cat_ere_results/1
  def destroy
    @cat_ere_result.destroy
    redirect_to cat_ere_results_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ere_result_params
      params.require(:cat_ere_result).permit(:key, :description, :cat_ere_expending_focu_id)
    end
end
