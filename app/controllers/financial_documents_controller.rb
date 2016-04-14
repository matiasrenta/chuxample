class FinancialDocumentsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :financial_document_params
  before_filter :resolve_parent_project_type, except: :index

  # GET /financial_documents
  def index
    @financial_documents = do_index(FinancialDocument, params)
  end

  # GET /financial_documents/1
  def show
  end

  # GET /financial_documents/new
  def new
    @new_with_type_path = eval("new_with_type_#{@project_activity_underscore}_financial_documents_path")
    @financial_document = FinancialDocumentBill.new # podria haber sido cualquiera de los otros tipos de docs, en el new_with_type se crea el que el usuario haya seleccionado
  end

  def new_with_type
    financial_document_type_id = params[:financial_document][:financial_document_type_id]
    @financial_document = FinancialDocumentType.find(financial_document_type_id).system_doc_type.constantize.new(financial_document_type_id: financial_document_type_id)
    render 'edit'
  end

  # GET /financial_documents/1/edit
  def edit
  end

  # POST /financial_documents
  def create
    financial_document_type_id = params[:financial_document][:financial_document_type_id]
    @financial_document = FinancialDocumentType.find(financial_document_type_id).system_doc_type.constantize.new(financial_document_params)
    @financial_document.project_activityable = @project_activityable
    if @financial_document.save
      redirect_to financial_document_path(@financial_document), notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@financial_document)
      render :edit
    end
  end

  # PATCH/PUT /financial_documents/1
  def update
    if @financial_document.check_file_presence_on_update(params) && @financial_document.update(financial_document_params)
      redirect_to financial_document_path(@financial_document), notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@financial_document)
      render :edit
    end
  end

  # DELETE /financial_documents/1
  def destroy
    if @financial_document.destroy
      redirect_to @list_path, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@financial_document)
      redirect_to :back
    end

  end

  private

  # Only allow a trusted parameter "white list" through.
  def financial_document_params
    params.require(:financial_document).permit(:nro_documento, :fecha_expedicion, :fecha_finalizacion, :monto, :supplier_id, :financial_document_type_id, :financial_document_contract_id, :description, :file, :remove_file)
  end

  def resolve_parent_project_type
    if @financial_document.try(:id)
      @project_activityable = @financial_document.project_activityable
    else
      project_activity_key = params.keys.find{|key| key.to_s.start_with?('project_activity_') }
      klass = project_activity_key.split('_id').first.camelize.constantize
      @project_activityable = klass.find(params[project_activity_key])
    end
    @klass = @project_activityable.class # ej: ProjectActivityObra
    @project_activity_underscore = @klass.name.underscore# ej: project_activity_obra
    @list_path = eval("#{@project_activity_underscore}_path(@project_activityable)")
    @url_form = financial_document_path(@financial_document) if @financial_document.try(:id)
    @url_form = "/#{@project_activity_underscore}s/#{@project_activityable.id}/financial_documents" unless @financial_document.try(:id)
  end

end

