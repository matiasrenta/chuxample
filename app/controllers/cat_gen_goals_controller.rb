class CatGenGoalsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_gen_goal_params

  # GET /cat_gen_goals
  def index
    @cat_gen_goals = do_index(CatGenGoal, params)
  end

  # GET /cat_gen_goals/1
  def show
  end

  # GET /cat_gen_goals/new
  def new
  end

  # GET /cat_gen_goals/1/edit
  def edit
  end

  # POST /cat_gen_goals
  def create

    if @cat_gen_goal.save
      redirect_to @cat_gen_goal, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_gen_goal)
      render :new
    end
  end

  # PATCH/PUT /cat_gen_goals/1
  def update
    if @cat_gen_goal.update(cat_gen_goal_params)
      redirect_to @cat_gen_goal, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_gen_goal)
      render :edit
    end
  end

  # DELETE /cat_gen_goals/1
  def destroy
    @cat_gen_goal.destroy
    redirect_to cat_gen_goals_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_gen_goal_params
      params.require(:cat_gen_goal).permit(:key, :description, :cat_gen_strategy_id)
    end
end
