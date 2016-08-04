class CatPprParPartidaGenericasController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_par_partida_generica_params

  # GET /cat_ppr_par_partida_genericas
  def index
    @cat_ppr_par_partida_genericas = indexize(CatPprParPartidaGenerica)
  end

  # GET /cat_ppr_par_partida_genericas/1
  def show
  end

  # GET /cat_ppr_par_partida_genericas/new
  def new
  end

  # GET /cat_ppr_par_partida_genericas/1/edit
  def edit
  end

  # POST /cat_ppr_par_partida_genericas
  def create

    if @cat_ppr_par_partida_generica.save
      redirect_to @cat_ppr_par_partida_generica, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_partida_generica)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_par_partida_genericas/1
  def update
    if @cat_ppr_par_partida_generica.update(cat_ppr_par_partida_generica_params)
      redirect_to @cat_ppr_par_partida_generica, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_partida_generica)
      render :edit
    end
  end

  # DELETE /cat_ppr_par_partida_genericas/1
  def destroy
    if @cat_ppr_par_partida_generica.destroy
      redirect_to cat_ppr_par_partida_genericas_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_ppr_par_partida_generica)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_par_partida_generica_params
      params.require(:cat_ppr_par_partida_generica).permit(:key, :description, :cat_ppr_par_concept_id)
    end
end
