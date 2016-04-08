class CatPprDigitIdentifiersController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_digit_identifier_params

  # GET /cat_ppr_digit_identifiers
  def index
    @cat_ppr_digit_identifiers = do_index(CatPprDigitIdentifier, params)
  end

  # GET /cat_ppr_digit_identifiers/1
  def show
  end

  # GET /cat_ppr_digit_identifiers/new
  def new
  end

  # GET /cat_ppr_digit_identifiers/1/edit
  def edit
  end

  # POST /cat_ppr_digit_identifiers
  def create

    if @cat_ppr_digit_identifier.save
      redirect_to @cat_ppr_digit_identifier, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_digit_identifier)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_digit_identifiers/1
  def update
    if @cat_ppr_digit_identifier.update(cat_ppr_digit_identifier_params)
      redirect_to @cat_ppr_digit_identifier, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_digit_identifier)
      render :edit
    end
  end

  # DELETE /cat_ppr_digit_identifiers/1
  def destroy
    if @cat_ppr_digit_identifier.destroy
      redirect_to cat_ppr_digit_identifiers_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_ppr_digit_identifier)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_digit_identifier_params
      params.require(:cat_ppr_digit_identifier).permit(:key, :description)
    end
end
