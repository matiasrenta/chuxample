class TerritorialUnitsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :territorial_unit_params

  # GET /territorial_units
  def index
    @territorial_units = indexize(TerritorialUnit)
  end

  # GET /territorial_units/1
  def show
  end

  # GET /territorial_units/new
  def new
  end

  # GET /territorial_units/1/edit
  def edit
  end

  # POST /territorial_units
  def create

    if @territorial_unit.save
      redirect_to @territorial_unit, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@territorial_unit)
      render :new
    end
  end

  # PATCH/PUT /territorial_units/1
  def update
    if @territorial_unit.update(territorial_unit_params)
      redirect_to @territorial_unit, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@territorial_unit)
      render :edit
    end
  end

  # DELETE /territorial_units/1
  def destroy
    if @territorial_unit.destroy
      redirect_to territorial_units_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@territorial_unit)
      redirect_to territorial_units_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def territorial_unit_params
      params.require(:territorial_unit).permit(:code, :name, :grado_marginacion)
    end
end
