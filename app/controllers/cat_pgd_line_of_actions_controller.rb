class CatPgdLineOfActionsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_pgd_line_of_action_params

  # GET /cat_pgd_line_of_actions
  def index
    @cat_pgd_line_of_actions = indexize(CatPgdLineOfAction)
  end

  # GET /cat_pgd_line_of_actions/1
  def show
  end

  # GET /cat_pgd_line_of_actions/new
  def new
  end

  # GET /cat_pgd_line_of_actions/1/edit
  def edit
  end

  # POST /cat_pgd_line_of_actions
  def create

    if @cat_pgd_line_of_action.save
      redirect_to @cat_pgd_line_of_action, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_pgd_line_of_action)
      render :new
    end
  end

  # PATCH/PUT /cat_pgd_line_of_actions/1
  def update
    if @cat_pgd_line_of_action.update(cat_pgd_line_of_action_params)
      redirect_to @cat_pgd_line_of_action, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_pgd_line_of_action)
      render :edit
    end
  end

  # DELETE /cat_pgd_line_of_actions/1
  def destroy
    if @cat_pgd_line_of_action.destroy
      redirect_to cat_pgd_line_of_actions_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_pgd_line_of_action)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_pgd_line_of_action_params
      params.require(:cat_pgd_line_of_action).permit(:key, :description, :cat_pgd_goal_id)
    end
end
