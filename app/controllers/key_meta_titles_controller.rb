class KeyMetaTitlesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :key_meta_title_params

  # GET /key_meta_titles
  def index
    @key_meta_titles = do_index(KeyMetaTitle, params)
  end

  # GET /key_meta_titles/1
  def show
  end

  # GET /key_meta_titles/new
  def new
  end

  # GET /key_meta_titles/1/edit
  def edit
  end

  # POST /key_meta_titles
  def create

    if @key_meta_title.save
      redirect_to @key_meta_title, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@key_meta_title)
      render :new
    end
  end

  # PATCH/PUT /key_meta_titles/1
  def update
    if @key_meta_title.update(key_meta_title_params)
      redirect_to @key_meta_title, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@key_meta_title)
      render :edit
    end
  end

  # DELETE /key_meta_titles/1
  def destroy
    @key_meta_title.destroy
    redirect_to key_meta_titles_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_meta_title_params
      params.require(:key_meta_title).permit(:name, :abbreviation, :key_meta_subcategory_id)
    end
end
