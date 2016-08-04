class LeyFraccionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :ley_fraccion_params

  # GET /ley_fraccions
  def index
    @ley_fraccions = indexize(LeyFraccion)
  end

  # GET /ley_fraccions/1
  def show
    @ley_articulo = @ley_fraccion.ley_articulo
  end

  # GET /ley_fraccions/new
  def new
    @ley_articulo = LeyArticulo.find(params[:ley_articulo_id])
  end

  # GET /ley_fraccions/1/edit
  def edit
    @ley_articulo = @ley_fraccion.ley_articulo
  end

  # POST /ley_fraccions
  def create
    @ley_articulo = LeyArticulo.find(params[:ley_articulo_id])
    @ley_fraccion = @ley_articulo.ley_fraccions.build(ley_fraccion_params)
    if @ley_fraccion.save
      redirect_to @ley_fraccion, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@ley_fraccion)
      render :new
    end
  end

  # PATCH/PUT /ley_fraccions/1
  def update
    if @ley_fraccion.update(ley_fraccion_params)
      redirect_to @ley_fraccion, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@ley_fraccion)
      render :edit
    end
  end

  # DELETE /ley_fraccions/1
  def destroy
    if @ley_fraccion.destroy
      redirect_to ley_articulo_path(@ley_fraccion.ley_articulo), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@ley_fraccion)
      redirect_to :back
    end
  end

  def validar_documento
    @ley_fraccion.validado = Date.today
    if @ley_fraccion.save
      redirect_to @ley_fraccion, notice: 'Validado exitosamente.'
    else
      generate_flash_msg_no_keep(@ley_fraccion)
      render :show
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def ley_fraccion_params
      params.require(:ley_fraccion).permit(:codigo, :name, :descripcion_de_documento, :periodo_actualizacion, :actualizado, :validado, :detalle, :file, :remove_file)
    end
end
