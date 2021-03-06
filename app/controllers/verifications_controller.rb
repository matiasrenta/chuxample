class VerificationsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :verification_params

  # GET /verifications
  def index
    @verifications = indexize(Verification)
  end

  # GET /verifications/1
  def show
  end

  # GET /verifications/new
  def new
  end

  # GET /verifications/1/edit
  def edit
  end

  # POST /verifications
  def create
    @verification.verification_owneable = current_user
    if @verification.save
      redirect_to @verification, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@verification)
      puts @verification.errors.full_messages.to_s
      render :new
    end
  end

  # PATCH/PUT /verifications/1
  def update
    @verification.verification_owneable = current_user unless @verification.verification_owneable
    if @verification.update(verification_params)
      redirect_to @verification, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@verification)
      render :edit
    end
  end

  # DELETE /verifications/1
  def destroy
    if @verification.destroy
      redirect_to verifications_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@verification)
      redirect_to verifications_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def verification_params
      params.require(:verification).permit({verification_photos_attributes: [:id, :name, :date_and_time, :latitude, :longitude, :_destroy]}, :project_activity_obra_id, :answer, :evaluation, :comments, :status)
    end
end
