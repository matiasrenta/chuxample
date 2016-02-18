class KeyMetaCategoriesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :key_meta_category_params

  # GET /key_meta_categories
  def index
    @key_meta_categories = do_index(KeyMetaCategory, params)
  end

  # GET /key_meta_categories/1
  def show
  end

  # GET /key_meta_categories/new
  def new
  end

  # GET /key_meta_categories/1/edit
  def edit
  end

  # POST /key_meta_categories
  def create

    if @key_meta_category.save
      redirect_to @key_meta_category, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@key_meta_category)
      render :new
    end
  end

  # PATCH/PUT /key_meta_categories/1
  def update
    if @key_meta_category.update(key_meta_category_params)
      redirect_to @key_meta_category, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@key_meta_category)
      render :edit
    end
  end

  # DELETE /key_meta_categories/1
  def destroy
    @key_meta_category.destroy
    redirect_to key_meta_categories_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_meta_category_params
      params.require(:key_meta_category).permit(:name)
    end
end
