class CatPprSpendingDestinationsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_spending_destination_params

  # GET /cat_ppr_spending_destinations
  def index
    @cat_ppr_spending_destinations = do_index(CatPprSpendingDestination, params)
  end

  # GET /cat_ppr_spending_destinations/1
  def show
  end

  # GET /cat_ppr_spending_destinations/new
  def new
  end

  # GET /cat_ppr_spending_destinations/1/edit
  def edit
  end

  # POST /cat_ppr_spending_destinations
  def create

    if @cat_ppr_spending_destination.save
      redirect_to @cat_ppr_spending_destination, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_spending_destination)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_spending_destinations/1
  def update
    if @cat_ppr_spending_destination.update(cat_ppr_spending_destination_params)
      redirect_to @cat_ppr_spending_destination, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_spending_destination)
      render :edit
    end
  end

  # DELETE /cat_ppr_spending_destinations/1
  def destroy
    @cat_ppr_spending_destination.destroy
    redirect_to cat_ppr_spending_destinations_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_spending_destination_params
      params.require(:cat_ppr_spending_destination).permit(:key, :description)
    end
end
