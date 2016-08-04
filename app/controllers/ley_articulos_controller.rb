class LeyArticulosController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :ley_articulo_params

  # GET /ley_articulos
  def index
    @ley_articulos = indexize(LeyArticulo, order: :codigo)
  end

  # GET /ley_articulos/1
  def show
    @ley_fraccions =  @ley_articulo.ley_fraccions.order(:id) # todo: ordenar por id no es lo correcto, tampoco se puede ordenar por :codigo porque 14.10 apareceria primero que 14.2
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

  def validar_documento
    @ley_articulo.validado = Date.today
    if @ley_articulo.save
      redirect_to @ley_articulo, notice: 'Validado exitosamente.'
    else
      generate_flash_msg_no_keep(@ley_articulo)
      render :show
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def ley_articulo_params
      params.require(:ley_articulo).permit(:codigo, :name, :descripcion_de_documento, :periodo_actualizacion, :actualizado, :validado, :detalle, :file, :remove_file)
    end
end
