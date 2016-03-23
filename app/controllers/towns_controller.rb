class TownsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :town_params

  # GET /towns
  def index
    @towns = do_index(Town, params)
  end

  # GET /towns/1
  def show
  end

  # GET /towns/new
  def new
  end

  # GET /towns/1/edit
  def edit
  end

  # POST /towns
  def create

    if @town.save
      redirect_to @town, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@town)
      render :new
    end
  end

  # PATCH/PUT /towns/1
  def update
    if @town.update(town_params)
      redirect_to @town, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@town)
      render :edit
    end
  end

  # DELETE /towns/1
  def destroy
    @town.destroy
    redirect_to towns_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def town_params
      params.require(:town).permit(:name, :abbreviation, :state_id)
    end
end
