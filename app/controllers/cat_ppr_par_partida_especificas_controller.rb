class CatPprParPartidaEspecificasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_par_partida_especifica_params

  # GET /cat_ppr_par_partida_especificas
  def index
    @cat_ppr_par_partida_especificas = do_index(CatPprParPartidaEspecifica, params)
  end

  # GET /cat_ppr_par_partida_especificas/1
  def show
  end

  # GET /cat_ppr_par_partida_especificas/new
  def new
  end

  # GET /cat_ppr_par_partida_especificas/1/edit
  def edit
  end

  # POST /cat_ppr_par_partida_especificas
  def create

    if @cat_ppr_par_partida_especifica.save
      redirect_to @cat_ppr_par_partida_especifica, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_partida_especifica)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_par_partida_especificas/1
  def update
    if @cat_ppr_par_partida_especifica.update(cat_ppr_par_partida_especifica_params)
      redirect_to @cat_ppr_par_partida_especifica, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_partida_especifica)
      render :edit
    end
  end

  # DELETE /cat_ppr_par_partida_especificas/1
  def destroy
    @cat_ppr_par_partida_especifica.destroy
    redirect_to cat_ppr_par_partida_especificas_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_par_partida_especifica_params
      params.require(:cat_ppr_par_partida_especifica).permit(:key, :description, :cat_ppr_par_partida_generica_id)
    end
end
