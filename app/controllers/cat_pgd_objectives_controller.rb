class CatPgdObjectivesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_pgd_objective_params

  # GET /cat_pgd_objectives
  def index
    @cat_pgd_objectives = do_index(CatPgdObjective, params)
  end

  # GET /cat_pgd_objectives/1
  def show
  end

  # GET /cat_pgd_objectives/new
  def new
  end

  # GET /cat_pgd_objectives/1/edit
  def edit
  end

  # POST /cat_pgd_objectives
  def create

    if @cat_pgd_objective.save
      redirect_to @cat_pgd_objective, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_pgd_objective)
      render :new
    end
  end

  # PATCH/PUT /cat_pgd_objectives/1
  def update
    if @cat_pgd_objective.update(cat_pgd_objective_params)
      redirect_to @cat_pgd_objective, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_pgd_objective)
      render :edit
    end
  end

  # DELETE /cat_pgd_objectives/1
  def destroy
    @cat_pgd_objective.destroy
    redirect_to cat_pgd_objectives_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_pgd_objective_params
      params.require(:cat_pgd_objective).permit(:key, :description, :cat_pgd_area_of_opportunity_id)
    end
end
