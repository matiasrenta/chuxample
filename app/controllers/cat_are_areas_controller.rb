class CatAreAreasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_are_area_params

  # GET /cat_are_areas
  def index
    @cat_are_areas = do_index(CatAreArea, params)
  end

  # GET /cat_are_areas/1
  def show
  end

  # GET /cat_are_areas/new
  def new
  end

  # GET /cat_are_areas/1/edit
  def edit
  end

  # POST /cat_are_areas
  def create

    if @cat_are_area.save
      redirect_to @cat_are_area, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_are_area)
      render :new
    end
  end

  # PATCH/PUT /cat_are_areas/1
  def update
    if @cat_are_area.update(cat_are_area_params)
      redirect_to @cat_are_area, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_are_area)
      render :edit
    end
  end

  # DELETE /cat_are_areas/1
  def destroy
    if @cat_are_area.destroy
      redirect_to cat_are_areas_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_are_area)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_are_area_params
      params.require(:cat_are_area).permit(:key, :description)
    end
end
