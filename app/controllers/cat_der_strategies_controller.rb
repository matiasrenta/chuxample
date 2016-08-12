class CatDerStrategiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_der_strategy_params

  # GET /cat_der_strategies
  def index
    @cat_der_strategies = indexize(CatDerStrategy)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /cat_der_strategies/1
  def show
  end

  # GET /cat_der_strategies/new
  def new
  end

  # GET /cat_der_strategies/1/edit
  def edit
  end

  # POST /cat_der_strategies
  def create

    if @cat_der_strategy.save
      redirect_to @cat_der_strategy, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_der_strategy)
      render :new
    end
  end

  # PATCH/PUT /cat_der_strategies/1
  def update
    if @cat_der_strategy.update(cat_der_strategy_params)
      redirect_to @cat_der_strategy, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_der_strategy)
      render :edit
    end
  end

  # DELETE /cat_der_strategies/1
  def destroy
    if @cat_der_strategy.destroy
      redirect_to cat_der_strategies_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_der_strategy)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_der_strategy_params
      params.require(:cat_der_strategy).permit(:key, :description, :cat_der_human_right_id)
    end
end
