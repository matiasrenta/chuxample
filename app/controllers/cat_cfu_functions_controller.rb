class CatCfuFunctionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_cfu_function_params

  # GET /cat_cfu_functions
  def index
    @cat_cfu_functions = indexize(CatCfuFunction)
  end

  # GET /cat_cfu_functions/1
  def show
  end

  # GET /cat_cfu_functions/new
  def new
  end

  # GET /cat_cfu_functions/1/edit
  def edit
  end

  # POST /cat_cfu_functions
  def create

    if @cat_cfu_function.save
      redirect_to @cat_cfu_function, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_cfu_function)
      render :new
    end
  end

  # PATCH/PUT /cat_cfu_functions/1
  def update
    if @cat_cfu_function.update(cat_cfu_function_params)
      redirect_to @cat_cfu_function, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_cfu_function)
      render :edit
    end
  end

  # DELETE /cat_cfu_functions/1
  def destroy
    if @cat_cfu_function.destroy
      redirect_to cat_cfu_functions_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_cfu_function)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_cfu_function_params
      params.require(:cat_cfu_function).permit(:key, :description, :cat_cfu_finality_id)
    end
end
