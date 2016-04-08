class CatEreSubresultsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ere_subresult_params

  # GET /cat_ere_subresults
  def index
    @cat_ere_subresults = do_index(CatEreSubresult, params)
  end

  # GET /cat_ere_subresults/1
  def show
  end

  # GET /cat_ere_subresults/new
  def new
  end

  # GET /cat_ere_subresults/1/edit
  def edit
  end

  # POST /cat_ere_subresults
  def create

    if @cat_ere_subresult.save
      redirect_to @cat_ere_subresult, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ere_subresult)
      render :new
    end
  end

  # PATCH/PUT /cat_ere_subresults/1
  def update
    if @cat_ere_subresult.update(cat_ere_subresult_params)
      redirect_to @cat_ere_subresult, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ere_subresult)
      render :edit
    end
  end

  # DELETE /cat_ere_subresults/1
  def destroy
    if @cat_ere_subresult.destroy
      redirect_to cat_ere_subresults_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_ere_subresult)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ere_subresult_params
      params.require(:cat_ere_subresult).permit(:key, :description, :cat_ere_result_id)
    end
end
