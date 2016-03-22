class FinancialDocumentsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :financial_document_params

  # GET /financial_documents
  def index
    @financial_documents = do_index(FinancialDocument, params)
  end

  # GET /financial_documents/1
  def show
  end

  # GET /financial_documents/new
  def new
    @project_activity = ProjectActivity.find(params[:project_activity_id])
  end

  # GET /financial_documents/1/edit
  def edit
  end

  # POST /financial_documents
  def create
    @project_activity = ProjectActivity.find(params[:project_activity_id])
    @financial_document = @project_activity.financial_documents.build(financial_document_params)
    if @financial_document.save
      redirect_to project_activity_path(@project_activity), notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@financial_document)
      render :new
    end
  end

  # PATCH/PUT /financial_documents/1
  def update
    if @financial_document.update(financial_document_params)
      redirect_to @financial_document, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@financial_document)
      render :edit
    end
  end

  # DELETE /financial_documents/1
  def destroy
    @financial_document.destroy
    redirect_to project_activity_path(@financial_document.project_activity_id), notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def financial_document_params
      params.require(:financial_document).permit(:doc_type, :code, :provider, :doc_date, :amount, :project_activity_id)
    end
end
