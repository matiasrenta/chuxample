class LeyArticulosController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :ley_articulo_params

  # GET /ley_articulos
  def index
    @ley_articulos = do_index(LeyArticulo, params)
  end

  # GET /ley_articulos/1
  def show
  end

  # GET /ley_articulos/new
  def new
  end

  # GET /ley_articulos/1/edit
  def edit
  end

  # POST /ley_articulos
  def create

    if @ley_articulo.save
      redirect_to @ley_articulo, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@ley_articulo)
      render :new
    end
  end

  # PATCH/PUT /ley_articulos/1
  def update
    if @ley_articulo.update(ley_articulo_params)
      redirect_to @ley_articulo, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@ley_articulo)
      render :edit
    end
  end

  # DELETE /ley_articulos/1
  def destroy
    if @ley_articulo.destroy
      redirect_to ley_articulos_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@ley_articulo)
      redirect_to ley_articulos_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def ley_articulo_params
      params.require(:ley_articulo).permit(:codigo, :name, :descripcion_de_documento, :periodo_actualizacion, :actualizado, :validado, :detalle, :file)
    end
end
