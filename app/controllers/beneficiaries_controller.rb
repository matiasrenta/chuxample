class BeneficiariesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :beneficiary_params
  before_filter :set_project_activity_social, except: :index

  # GET /beneficiaries
  def index
    @beneficiaries = do_index(Beneficiary, params)
  end

  # GET /beneficiaries/1
  def show
  end

  # GET /beneficiaries/new
  def new
  end

  # GET /beneficiaries/1/edit
  def edit
  end

  # POST /beneficiaries
  def create
    @beneficiary = @project_activity_social.beneficiaries.build(beneficiary_params)
    if @beneficiary.save
      redirect_to @beneficiary, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@beneficiary)
      render :new
    end
  end

  # PATCH/PUT /beneficiaries/1
  def update
    if @beneficiary.update(beneficiary_params)
      redirect_to @beneficiary, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@beneficiary)
      render :edit
    end
  end

  # DELETE /beneficiaries/1
  def destroy
    if @beneficiary.destroy
      redirect_to project_activity_social_path(@project_activity_social), notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@beneficiary)
      redirect_to :back
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def beneficiary_params
    params.require(:beneficiary).permit(:apellido_paterno, :apellido_materno, :nombres, :territorial_unit_id, :sexo, :edad, :fecha_nacimiento, :lugar_nacimiento, :pertenencia_etnica, :grado_maximo_estudios, :anios_residencia_en_df, :domicilio, :ocupacion, :nombre_padre, :nombre_madre, :curp)
  end

  def set_project_activity_social
    if @beneficiary.try(:id)
      @project_activity_social = @beneficiary.project_activity_social
    else
      @project_activity_social = ProjectActivitySocial.find(params[:project_activity_social_id])
    end
  end

end
