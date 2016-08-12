class CatFonOriginResourcesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_fon_origin_resource_params

  # GET /cat_fon_origin_resources
  def index
    @cat_fon_origin_resources = indexize(CatFonOriginResource)
  end

  # GET /cat_fon_origin_resources/1
  def show
  end

  # GET /cat_fon_origin_resources/new
  def new
  end

  # GET /cat_fon_origin_resources/1/edit
  def edit
  end

  # POST /cat_fon_origin_resources
  def create

    if @cat_fon_origin_resource.save
      redirect_to @cat_fon_origin_resource, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_fon_origin_resource)
      render :new
    end
  end

  # PATCH/PUT /cat_fon_origin_resources/1
  def update
    if @cat_fon_origin_resource.update(cat_fon_origin_resource_params)
      redirect_to @cat_fon_origin_resource, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_fon_origin_resource)
      render :edit
    end
  end

  # DELETE /cat_fon_origin_resources/1
  def destroy
    if @cat_fon_origin_resource.destroy
      redirect_to cat_fon_origin_resources_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_fon_origin_resource)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_fon_origin_resource_params
      params.require(:cat_fon_origin_resource).permit(:key, :description)
    end
end
