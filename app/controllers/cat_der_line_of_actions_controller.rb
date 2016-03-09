class CatDerLineOfActionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_der_line_of_action_params

  # GET /cat_der_line_of_actions
  def index
    @cat_der_line_of_actions = do_index(CatDerLineOfAction, params)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /cat_der_line_of_actions/1
  def show
  end

  # GET /cat_der_line_of_actions/new
  def new
  end

  # GET /cat_der_line_of_actions/1/edit
  def edit
  end

  # POST /cat_der_line_of_actions
  def create

    if @cat_der_line_of_action.save
      redirect_to @cat_der_line_of_action, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_der_line_of_action)
      render :new
    end
  end

  # PATCH/PUT /cat_der_line_of_actions/1
  def update
    if @cat_der_line_of_action.update(cat_der_line_of_action_params)
      redirect_to @cat_der_line_of_action, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_der_line_of_action)
      render :edit
    end
  end

  # DELETE /cat_der_line_of_actions/1
  def destroy
    @cat_der_line_of_action.destroy
    redirect_to cat_der_line_of_actions_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_der_line_of_action_params
      params.require(:cat_der_line_of_action).permit(:key, :description, :cat_der_strategy_id)
    end
end
