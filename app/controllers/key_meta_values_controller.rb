class KeyMetaValuesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :key_meta_value_params

  # GET /key_meta_values
  def index
    @key_meta_values = do_index(KeyMetaValue, params)
  end

  # GET /key_meta_values/1
  def show
  end

  # GET /key_meta_values/new
  def new
  end

  # GET /key_meta_values/1/edit
  def edit
  end

  # POST /key_meta_values
  def create

    if @key_meta_value.save
      redirect_to @key_meta_value, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@key_meta_value)
      render :new
    end
  end

  # PATCH/PUT /key_meta_values/1
  def update
    if @key_meta_value.update(key_meta_value_params)
      redirect_to @key_meta_value, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@key_meta_value)
      render :edit
    end
  end

  # DELETE /key_meta_values/1
  def destroy
    @key_meta_value.destroy
    redirect_to key_meta_values_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def key_meta_value_params
      params.require(:key_meta_value).permit(:key_value, :key_description, :key_meta_title_id)
    end
end
