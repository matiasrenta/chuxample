class CatPgdAxisController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_pgd_axi_params

  # GET /cat_pgd_axis
  def index
    @cat_pgd_axis = indexize(CatPgdAxi)
  end

  # GET /cat_pgd_axis/1
  def show
  end

  # GET /cat_pgd_axis/new
  def new
  end

  # GET /cat_pgd_axis/1/edit
  def edit
  end

  # POST /cat_pgd_axis
  def create

    if @cat_pgd_axi.save
      redirect_to @cat_pgd_axi, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_pgd_axi)
      render :new
    end
  end

  # PATCH/PUT /cat_pgd_axis/1
  def update
    if @cat_pgd_axi.update(cat_pgd_axi_params)
      redirect_to @cat_pgd_axi, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_pgd_axi)
      render :edit
    end
  end

  # DELETE /cat_pgd_axis/1
  def destroy
    if @cat_pgd_axi.destroy
      redirect_to cat_pgd_axis_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_pgd_axi)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_pgd_axi_params
      params.require(:cat_pgd_axi).permit(:key, :description)
    end
end
