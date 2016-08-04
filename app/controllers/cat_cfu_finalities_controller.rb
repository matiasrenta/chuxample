class CatCfuFinalitiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_cfu_finality_params

  # GET /cat_cfu_finalities
  def index
    @cat_cfu_finalities = indexize(CatCfuFinality)
  end

  # GET /cat_cfu_finalities/1
  def show
  end

  # GET /cat_cfu_finalities/new
  def new
  end

  # GET /cat_cfu_finalities/1/edit
  def edit
  end

  # POST /cat_cfu_finalities
  def create

    if @cat_cfu_finality.save
      redirect_to @cat_cfu_finality, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_cfu_finality)
      render :new
    end
  end

  # PATCH/PUT /cat_cfu_finalities/1
  def update
    if @cat_cfu_finality.update(cat_cfu_finality_params)
      redirect_to @cat_cfu_finality, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_cfu_finality)
      render :edit
    end
  end

  # DELETE /cat_cfu_finalities/1
  def destroy
    if @cat_cfu_finality.destroy
      redirect_to cat_cfu_finalities_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_cfu_finality)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_cfu_finality_params
      params.require(:cat_cfu_finality).permit(:key, :description)
    end
end
