class CatFonYearDocumentsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_fon_year_document_params

  # GET /cat_fon_year_documents
  def index
    @cat_fon_year_documents = indexize(CatFonYearDocument)
  end

  # GET /cat_fon_year_documents/1
  def show
  end

  # GET /cat_fon_year_documents/new
  def new
  end

  # GET /cat_fon_year_documents/1/edit
  def edit
  end

  # POST /cat_fon_year_documents
  def create

    if @cat_fon_year_document.save
      redirect_to @cat_fon_year_document, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_fon_year_document)
      render :new
    end
  end

  # PATCH/PUT /cat_fon_year_documents/1
  def update
    if @cat_fon_year_document.update(cat_fon_year_document_params)
      redirect_to @cat_fon_year_document, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_fon_year_document)
      render :edit
    end
  end

  # DELETE /cat_fon_year_documents/1
  def destroy
    if @cat_fon_year_document.destroy
      redirect_to cat_fon_year_documents_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_fon_year_document)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_fon_year_document_params
      params.require(:cat_fon_year_document).permit(:key, :description)
    end
end
