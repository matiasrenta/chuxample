class CatEreExpendingFocusController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ere_expending_focu_params

  # GET /cat_ere_expending_focus
  def index
    @cat_ere_expending_focus = do_index(CatEreExpendingFocu, params)
  end

  # GET /cat_ere_expending_focus/1
  def show
  end

  # GET /cat_ere_expending_focus/new
  def new
  end

  # GET /cat_ere_expending_focus/1/edit
  def edit
  end

  # POST /cat_ere_expending_focus
  def create

    if @cat_ere_expending_focu.save
      redirect_to @cat_ere_expending_focu, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ere_expending_focu)
      render :new
    end
  end

  # PATCH/PUT /cat_ere_expending_focus/1
  def update
    if @cat_ere_expending_focu.update(cat_ere_expending_focu_params)
      redirect_to @cat_ere_expending_focu, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ere_expending_focu)
      render :edit
    end
  end

  # DELETE /cat_ere_expending_focus/1
  def destroy
    if @cat_ere_expending_focu.destroy
      redirect_to cat_ere_expending_focus_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_ere_expending_focu)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ere_expending_focu_params
      params.require(:cat_ere_expending_focu).permit(:key, :description)
    end
end
