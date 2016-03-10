class CatPgdAreaOfOpportunitiesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_pgd_area_of_opportunity_params

  # GET /cat_pgd_area_of_opportunities
  def index
    @cat_pgd_area_of_opportunities = do_index(CatPgdAreaOfOpportunity, params)
  end

  # GET /cat_pgd_area_of_opportunities/1
  def show
  end

  # GET /cat_pgd_area_of_opportunities/new
  def new
  end

  # GET /cat_pgd_area_of_opportunities/1/edit
  def edit
  end

  # POST /cat_pgd_area_of_opportunities
  def create

    if @cat_pgd_area_of_opportunity.save
      redirect_to @cat_pgd_area_of_opportunity, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_pgd_area_of_opportunity)
      render :new
    end
  end

  # PATCH/PUT /cat_pgd_area_of_opportunities/1
  def update
    if @cat_pgd_area_of_opportunity.update(cat_pgd_area_of_opportunity_params)
      redirect_to @cat_pgd_area_of_opportunity, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_pgd_area_of_opportunity)
      render :edit
    end
  end

  # DELETE /cat_pgd_area_of_opportunities/1
  def destroy
    @cat_pgd_area_of_opportunity.destroy
    redirect_to cat_pgd_area_of_opportunities_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_pgd_area_of_opportunity_params
      params.require(:cat_pgd_area_of_opportunity).permit(:key, :description, :cat_pgd_axi_id)
    end
end
