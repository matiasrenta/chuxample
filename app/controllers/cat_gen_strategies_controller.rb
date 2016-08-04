class CatGenStrategiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_gen_strategy_params

  # GET /cat_gen_strategies
  def index
    @cat_gen_strategies = indexize(CatGenStrategy)
  end

  # GET /cat_gen_strategies/1
  def show
  end

  # GET /cat_gen_strategies/new
  def new
  end

  # GET /cat_gen_strategies/1/edit
  def edit
  end

  # POST /cat_gen_strategies
  def create

    if @cat_gen_strategy.save
      redirect_to @cat_gen_strategy, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_gen_strategy)
      render :new
    end
  end

  # PATCH/PUT /cat_gen_strategies/1
  def update
    if @cat_gen_strategy.update(cat_gen_strategy_params)
      redirect_to @cat_gen_strategy, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_gen_strategy)
      render :edit
    end
  end

  # DELETE /cat_gen_strategies/1
  def destroy
    if @cat_gen_strategy.destroy
      redirect_to cat_gen_strategies_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_gen_strategy)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_gen_strategy_params
      params.require(:cat_gen_strategy).permit(:key, :description, :cat_gen_objective_id)
    end
end
