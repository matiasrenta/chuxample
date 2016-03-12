class CatPprExpenseTypesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_expense_type_params

  # GET /cat_ppr_expense_types
  def index
    @cat_ppr_expense_types = do_index(CatPprExpenseType, params)
  end

  # GET /cat_ppr_expense_types/1
  def show
  end

  # GET /cat_ppr_expense_types/new
  def new
  end

  # GET /cat_ppr_expense_types/1/edit
  def edit
  end

  # POST /cat_ppr_expense_types
  def create

    if @cat_ppr_expense_type.save
      redirect_to @cat_ppr_expense_type, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_expense_type)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_expense_types/1
  def update
    if @cat_ppr_expense_type.update(cat_ppr_expense_type_params)
      redirect_to @cat_ppr_expense_type, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_expense_type)
      render :edit
    end
  end

  # DELETE /cat_ppr_expense_types/1
  def destroy
    @cat_ppr_expense_type.destroy
    redirect_to cat_ppr_expense_types_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_expense_type_params
      params.require(:cat_ppr_expense_type).permit(:key, :description)
    end
end
