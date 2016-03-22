class ProfileObrasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :profile_obra_params

  # GET /profile_obras
  def index
    @profile_obras = do_index(ProfileObra, params)
  end

  # GET /profile_obras/1
  def show
  end

  # GET /profile_obras/new
  def new
  end

  # GET /profile_obras/1/edit
  def edit
  end

  # POST /profile_obras
  def create

    if @profile_obra.save
      redirect_to @profile_obra, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@profile_obra)
      render :new
    end
  end

  # PATCH/PUT /profile_obras/1
  def update
    if @profile_obra.update(profile_obra_params)
      redirect_to @profile_obra, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@profile_obra)
      render :edit
    end
  end

  # DELETE /profile_obras/1
  def destroy
    @profile_obra.destroy
    redirect_to profile_obras_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def profile_obra_params
      params.require(:profile_obra).permit(:contrato, :calle, :numero, :colonia, :codigo_postal, :tipo_obra, :cantidad, :importe, :fecha_inicio, :fecha_fin, :avance_programado, :avance_real)
    end
end
