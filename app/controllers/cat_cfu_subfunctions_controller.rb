class CatCfuSubfunctionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_cfu_subfunction_params

  # GET /cat_cfu_subfunctions
  def index
    @cat_cfu_subfunctions = indexize(CatCfuSubfunction)
  end

  # GET /cat_cfu_subfunctions/1
  def show
  end

  # GET /cat_cfu_subfunctions/new
  def new
  end

  # GET /cat_cfu_subfunctions/1/edit
  def edit
  end

  # POST /cat_cfu_subfunctions
  def create

    if @cat_cfu_subfunction.save
      redirect_to @cat_cfu_subfunction, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_cfu_subfunction)
      render :new
    end
  end

  # PATCH/PUT /cat_cfu_subfunctions/1
  def update
    if @cat_cfu_subfunction.update(cat_cfu_subfunction_params)
      redirect_to @cat_cfu_subfunction, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_cfu_subfunction)
      render :edit
    end
  end

  # DELETE /cat_cfu_subfunctions/1
  def destroy
    if @cat_cfu_subfunction.destroy
      redirect_to cat_cfu_subfunctions_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_cfu_subfunction)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_cfu_subfunction_params
      params.require(:cat_cfu_subfunction).permit(:key, :description, :cat_cfu_function_id)
    end
end
