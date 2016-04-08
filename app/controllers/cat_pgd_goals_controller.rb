class CatPgdGoalsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_pgd_goal_params

  # GET /cat_pgd_goals
  def index
    @cat_pgd_goals = do_index(CatPgdGoal, params)
  end

  # GET /cat_pgd_goals/1
  def show
  end

  # GET /cat_pgd_goals/new
  def new
  end

  # GET /cat_pgd_goals/1/edit
  def edit
  end

  # POST /cat_pgd_goals
  def create

    if @cat_pgd_goal.save
      redirect_to @cat_pgd_goal, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_pgd_goal)
      render :new
    end
  end

  # PATCH/PUT /cat_pgd_goals/1
  def update
    if @cat_pgd_goal.update(cat_pgd_goal_params)
      redirect_to @cat_pgd_goal, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_pgd_goal)
      render :edit
    end
  end

  # DELETE /cat_pgd_goals/1
  def destroy
    if @cat_pgd_goal.destroy
      redirect_to cat_pgd_goals_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_pgd_goal)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_pgd_goal_params
      params.require(:cat_pgd_goal).permit(:key, :description, :cat_pgd_objective_id)
    end
end
