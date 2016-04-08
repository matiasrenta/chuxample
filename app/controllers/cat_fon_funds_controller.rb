class CatFonFundsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_fon_fund_params

  # GET /cat_fon_funds
  def index
    @cat_fon_funds = do_index(CatFonFund, params)
  end

  # GET /cat_fon_funds/1
  def show
  end

  # GET /cat_fon_funds/new
  def new
  end

  # GET /cat_fon_funds/1/edit
  def edit
  end

  # POST /cat_fon_funds
  def create

    if @cat_fon_fund.save
      redirect_to @cat_fon_fund, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_fon_fund)
      render :new
    end
  end

  # PATCH/PUT /cat_fon_funds/1
  def update
    if @cat_fon_fund.update(cat_fon_fund_params)
      redirect_to @cat_fon_fund, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_fon_fund)
      render :edit
    end
  end

  # DELETE /cat_fon_funds/1
  def destroy
    if @cat_fon_fund.destroy
      redirect_to cat_fon_funds_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_fon_fund)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_fon_fund_params
      params.require(:cat_fon_fund).permit(:key, :description, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id)
    end
end
