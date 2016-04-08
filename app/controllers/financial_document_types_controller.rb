class FinancialDocumentTypesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :financial_document_type_params

  # GET /financial_document_types
  def index
    @financial_document_types = do_index(FinancialDocumentType, params)
  end

  # GET /financial_document_types/1
  def show
  end

  # GET /financial_document_types/new
  def new
  end

  # GET /financial_document_types/1/edit
  def edit
  end

  # POST /financial_document_types
  def create

    if @financial_document_type.save
      redirect_to @financial_document_type, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@financial_document_type)
      render :new
    end
  end

  # PATCH/PUT /financial_document_types/1
  def update
    if @financial_document_type.update(financial_document_type_params)
      redirect_to @financial_document_type, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@financial_document_type)
      render :edit
    end
  end

  # DELETE /financial_document_types/1
  def destroy
    if @financial_document_type.destroy
      redirect_to financial_document_types_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@financial_document_type)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def financial_document_type_params
      params.require(:financial_document_type).permit({chapter_ids: []}, :name, :description, :system_doc_type)
    end
end
