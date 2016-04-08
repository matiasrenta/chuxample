class CatGenAxisController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_gen_axi_params

  # GET /cat_gen_axis
  def index
    @cat_gen_axis = do_index(CatGenAxi, params)
  end

  # GET /cat_gen_axis/1
  def show
  end

  # GET /cat_gen_axis/new
  def new
  end

  # GET /cat_gen_axis/1/edit
  def edit
  end

  # POST /cat_gen_axis
  def create

    if @cat_gen_axi.save
      redirect_to @cat_gen_axi, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_gen_axi)
      render :new
    end
  end

  # PATCH/PUT /cat_gen_axis/1
  def update
    if @cat_gen_axi.update(cat_gen_axi_params)
      redirect_to @cat_gen_axi, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_gen_axi)
      render :edit
    end
  end

  # DELETE /cat_gen_axis/1
  def destroy
    if @cat_gen_axi.destroy
      redirect_to cat_gen_axis_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_gen_axi)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_gen_axi_params
      params.require(:cat_gen_axi).permit(:key, :description)
    end
end
