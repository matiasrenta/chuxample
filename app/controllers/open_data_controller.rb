class OpenDataController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :open_datum_params

  # GET /open_data
  def index
    @open_data = indexize(OpenDatum)
  end

  # GET /open_data/1
  def show
  end

  # GET /open_data/new
  def new
  end

  # GET /open_data/1/edit
  def edit
  end

  # POST /open_data
  def create
    if @open_datum.save
      redirect_to @open_datum, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@open_datum)
      render :new
    end
  end

  # PATCH/PUT /open_data/1
  def update
    if @open_datum.update(open_datum_params)
      redirect_to @open_datum, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@open_datum)
      render :edit
    end
  end

  # DELETE /open_data/1
  def destroy
    if @open_datum.destroy
      redirect_to open_data_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@open_datum)
      redirect_to open_data_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def open_datum_params
      params.require(:open_datum).permit(:title, :description, :labels, :published_by, :contact, :email, :file, :remove_file)
    end
end
