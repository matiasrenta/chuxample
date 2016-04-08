class CatAciInstitutionalActivitiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_aci_institutional_activity_params

  # GET /cat_aci_institutional_activities
  def index
    @cat_aci_institutional_activities = do_index(CatAciInstitutionalActivity, params)
  end

  # GET /cat_aci_institutional_activities/1
  def show
  end

  # GET /cat_aci_institutional_activities/new
  def new
  end

  # GET /cat_aci_institutional_activities/1/edit
  def edit
  end

  # POST /cat_aci_institutional_activities
  def create

    if @cat_aci_institutional_activity.save
      redirect_to @cat_aci_institutional_activity, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_aci_institutional_activity)
      render :new
    end
  end

  # PATCH/PUT /cat_aci_institutional_activities/1
  def update
    if @cat_aci_institutional_activity.update(cat_aci_institutional_activity_params)
      redirect_to @cat_aci_institutional_activity, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_aci_institutional_activity)
      render :edit
    end
  end

  # DELETE /cat_aci_institutional_activities/1
  def destroy
    if @cat_aci_institutional_activity.destroy
      redirect_to cat_aci_institutional_activities_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_aci_institutional_activity)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_aci_institutional_activity_params
      params.require(:cat_aci_institutional_activity).permit(:key, :description, :cat_pgd_axi_id, :cat_ere_expending_focu_id, :cat_ere_result_id, :cat_ere_subresult_id, :cat_cfu_finality_id, :cat_cfu_function_id, :cat_cfu_subfunction_id)
    end
end
