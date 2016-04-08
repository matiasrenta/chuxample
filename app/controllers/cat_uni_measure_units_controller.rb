class CatUniMeasureUnitsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_uni_measure_unit_params

  # GET /cat_uni_measure_units
  def index
    @cat_uni_measure_units = do_index(CatUniMeasureUnit, params)
  end

  # GET /cat_uni_measure_units/1
  def show
  end

  # GET /cat_uni_measure_units/new
  def new
  end

  # GET /cat_uni_measure_units/1/edit
  def edit
  end

  # POST /cat_uni_measure_units
  def create

    if @cat_uni_measure_unit.save
      redirect_to @cat_uni_measure_unit, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_uni_measure_unit)
      render :new
    end
  end

  # PATCH/PUT /cat_uni_measure_units/1
  def update
    if @cat_uni_measure_unit.update(cat_uni_measure_unit_params)
      redirect_to @cat_uni_measure_unit, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_uni_measure_unit)
      render :edit
    end
  end

  # DELETE /cat_uni_measure_units/1
  def destroy
    if @cat_uni_measure_unit.destroy
      redirect_to cat_uni_measure_units_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_uni_measure_unit)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_uni_measure_unit_params
      params.require(:cat_uni_measure_unit).permit(:key, :description)
    end
end
