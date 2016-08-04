class StaffsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :staff_params

  # GET /staffs
  def index
    @staffs = indexize(Staff)
  end

  # GET /staffs/1
  def show
  end

  # GET /staffs/new
  def new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  def create

    if @staff.save
      redirect_to @staff, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@staff)
      render :new
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      redirect_to @staff, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@staff)
      render :edit
    end
  end

  # DELETE /staffs/1
  def destroy
    if @staff.destroy
      redirect_to staffs_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@staff)
      redirect_to staffs_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def staff_params
      params.require(:staff).permit(:apellido_paterno, :apellido_materno, :nombres, :sexo, :fecha_nacimiento, :indefinido, :periodo_desde, :periodo_hasta, :job_title_id, :ascription_id, :anios_residencia_en_df, :domicilio, :ocupacion, :nombre_padre, :nombre_madre, :curp, :importe_actual)
    end
end
