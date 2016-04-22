class AscriptionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :ascription_params

  # GET /ascriptions
  def index
    @ascriptions = do_index(Ascription, params)
  end

  # GET /ascriptions/1
  def show
  end

  # GET /ascriptions/new
  def new
  end

  # GET /ascriptions/1/edit
  def edit
  end

  # POST /ascriptions
  def create

    if @ascription.save
      redirect_to @ascription, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@ascription)
      render :new
    end
  end

  # PATCH/PUT /ascriptions/1
  def update
    if @ascription.update(ascription_params)
      redirect_to @ascription, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@ascription)
      render :edit
    end
  end

  # DELETE /ascriptions/1
  def destroy
    if @ascription.destroy
      redirect_to ascriptions_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@ascription)
      redirect_to ascriptions_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def ascription_params
      params.require(:ascription).permit(:name)
    end
end
