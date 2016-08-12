class CatDerHumanRightsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_der_human_right_params

  # GET /cat_der_human_rights
  def index
    @cat_der_human_rights = indexize(CatDerHumanRight)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /cat_der_human_rights/1
  def show
  end

  # GET /cat_der_human_rights/new
  def new
  end

  # GET /cat_der_human_rights/1/edit
  def edit
  end

  # POST /cat_der_human_rights
  def create

    if @cat_der_human_right.save
      redirect_to @cat_der_human_right, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_der_human_right)
      render :new
    end
  end

  # PATCH/PUT /cat_der_human_rights/1
  def update
    if @cat_der_human_right.update(cat_der_human_right_params)
      redirect_to @cat_der_human_right, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_der_human_right)
      render :edit
    end
  end

  # DELETE /cat_der_human_rights/1
  def destroy
    if @cat_der_human_right.destroy
      redirect_to cat_der_human_rights_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_der_human_right)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_der_human_right_params
      params.require(:cat_der_human_right).permit(:key, :description)
    end
end
