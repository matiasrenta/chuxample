class CatGenObjectivesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_gen_objective_params

  # GET /cat_gen_objectives
  def index
    @cat_gen_objectives = do_index(CatGenObjective, params)
  end

  # GET /cat_gen_objectives/1
  def show
  end

  # GET /cat_gen_objectives/new
  def new
  end

  # GET /cat_gen_objectives/1/edit
  def edit
  end

  # POST /cat_gen_objectives
  def create

    if @cat_gen_objective.save
      redirect_to @cat_gen_objective, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_gen_objective)
      render :new
    end
  end

  # PATCH/PUT /cat_gen_objectives/1
  def update
    if @cat_gen_objective.update(cat_gen_objective_params)
      redirect_to @cat_gen_objective, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_gen_objective)
      render :edit
    end
  end

  # DELETE /cat_gen_objectives/1
  def destroy
    @cat_gen_objective.destroy
    redirect_to cat_gen_objectives_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_gen_objective_params
      params.require(:cat_gen_objective).permit(:key, :description, :cat_gen_axi_id)
    end
end
