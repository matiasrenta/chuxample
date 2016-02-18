class KeyMetaSubcategoriesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :key_meta_subcategory_params

  # GET /key_meta_subcategories
  def index
    @key_meta_subcategories = do_index(KeyMetaSubcategory, params)
  end

  # GET /key_meta_subcategories/1
  def show
  end

  # GET /key_meta_subcategories/new
  def new
  end

  # GET /key_meta_subcategories/1/edit
  def edit
  end

  # POST /key_meta_subcategories
  def create

    if @key_meta_subcategory.save
      redirect_to @key_meta_subcategory, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@key_meta_subcategory)
      render :new
    end
  end

  # PATCH/PUT /key_meta_subcategories/1
  def update
    if @key_meta_subcategory.update(key_meta_subcategory_params)
      redirect_to @key_meta_subcategory, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@key_meta_subcategory)
      render :edit
    end
  end

  # DELETE /key_meta_subcategories/1
  def destroy
    @key_meta_subcategory.destroy
    redirect_to key_meta_subcategories_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_meta_subcategory_params
      params.require(:key_meta_subcategory).permit(:name, :key_meta_category_id)
    end
end
