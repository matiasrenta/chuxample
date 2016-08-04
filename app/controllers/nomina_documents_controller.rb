class NominaDocumentsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :nomina_document_params

  # GET /nomina_documents
  def index
    @nomina_documents = indexize(NominaDocument)
  end

  # GET /nomina_documents/1
  def show
  end

  # GET /nomina_documents/new
  def new
  end

  # GET /nomina_documents/1/edit
  def edit
  end

  # POST /nomina_documents
  def create

    if @nomina_document.save
      redirect_to @nomina_document, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@nomina_document)
      render :new
    end
  end

  # PATCH/PUT /nomina_documents/1
  def update
    if @nomina_document.update(nomina_document_params)
      redirect_to @nomina_document, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@nomina_document)
      render :edit
    end
  end

  # DELETE /nomina_documents/1
  def destroy
    if @nomina_document.destroy
      redirect_to nomina_documents_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@nomina_document)
      redirect_to nomina_documents_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def nomina_document_params
      params.require(:nomina_document).permit({nomina_document_items_attributes: [:_destroy, :id, :cat_ppr_par_partida_especifica_id, :monto]}, :month, :year, :file, :remove_file)
    end
end
