class CatFonFundingSourcesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_fon_funding_source_params

  # GET /cat_fon_funding_sources
  def index
    @cat_fon_funding_sources = indexize(CatFonFundingSource)
  end

  # GET /cat_fon_funding_sources/1
  def show
  end

  # GET /cat_fon_funding_sources/new
  def new
  end

  # GET /cat_fon_funding_sources/1/edit
  def edit
  end

  # POST /cat_fon_funding_sources
  def create

    if @cat_fon_funding_source.save
      redirect_to @cat_fon_funding_source, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_fon_funding_source)
      render :new
    end
  end

  # PATCH/PUT /cat_fon_funding_sources/1
  def update
    if @cat_fon_funding_source.update(cat_fon_funding_source_params)
      redirect_to @cat_fon_funding_source, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_fon_funding_source)
      render :edit
    end
  end

  # DELETE /cat_fon_funding_sources/1
  def destroy
    if @cat_fon_funding_source.destroy
      redirect_to cat_fon_funding_sources_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_fon_funding_source)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_fon_funding_source_params
      params.require(:cat_fon_funding_source).permit(:key, :description)
    end
end
