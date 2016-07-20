class DashboardController < ApplicationController

  def index
    authorize! :read, :dashboard
    set_content_title('fa-fw fa fa-dashboard', ['Dashboard'])
    presupuesto
    documentos
    suppliers
    afectaciones
    activities_obras
  end

  private

  def presupuesto
    @pre_total             = KeyAnalytical.sum(:modificado)
    @pre_by_chapter        = KeyAnalytical.select('sum(modificado) as value, cat_ppr_par_chapter_id').includes(:cat_ppr_par_chapter).group(:cat_ppr_par_chapter_id)
                                 .map{ |c| ["#{c.cat_ppr_par_chapter.key}-#{c.cat_ppr_par_chapter.description}", c.value] }.to_h
    @pre_by_area           = KeyAnalytical.select('sum(modificado) as value, cat_are_area_id').includes(:cat_are_area).group(:cat_are_area_id)
                                 .map{ |c| [c.cat_are_area.description, c.value] }.to_h
    @pre_by_project_type   = KeyAnalytical.select('sum(modificado) as value, project_type').group(:project_type)
                                 .map{ |c| [c.project_type, c.value] }.to_h
    @pre_by_funding_source = KeyAnalytical.select('sum(modificado) as value, cat_fon_funding_source_id').includes(:cat_fon_funding_source).group(:cat_fon_funding_source_id)
                                 .map{ |c| [c.cat_fon_funding_source.description, c.value] }.to_h
    @pre_by_expense_type   = KeyAnalytical.select('sum(modificado) as value, cat_ppr_expense_type_id').includes(:cat_ppr_expense_type).group(:cat_ppr_expense_type_id)
                                 .map{ |c| [c.cat_ppr_expense_type.description, c.value] }.to_h
  end

  def documentos
    @doc_total = FinancialDocument.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
                     .map{ |c| [c.financial_document_type.name, c.value] }.to_h
    @doc_obras = FinancialDocument.obras.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
                     .map{ |c| [c.financial_document_type.name, c.value] }.to_h
    @doc_socials = FinancialDocument.socials.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
                       .map{ |c| [c.financial_document_type.name, c.value] }.to_h
    @doc_nominas = FinancialDocument.nominas.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
                       .map{ |c| [c.financial_document_type.name, c.value] }.to_h
    @doc_adquisicions = FinancialDocument.adquisicions.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
                            .map{ |c| [c.financial_document_type.name, c.value] }.to_h
  end

  def suppliers
    @sup_total = FinancialDocument.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
                     .map{ |c| [c.supplier.name, c.value] }.to_h
    @sup_obras = FinancialDocument.obras.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
                     .map{ |c| [c.supplier.name, c.value] }.to_h
    @sup_socials = FinancialDocument.socials.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
                       .map{ |c| [c.supplier.name, c.value] }.to_h
    @sup_adquisicions = FinancialDocument.adquisicions.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
                            .map{ |c| [c.supplier.name, c.value] }.to_h
  end

  def afectaciones
    @afe_total = KeyAnalytical.con_afectaciones.count
    @afe_projects = KeyAnalytical.con_afectaciones.group(:project_type).count
    @afe_chapters = KeyAnalytical.con_afectaciones.select('count(*) as value, cat_ppr_par_chapter_id').includes(:cat_ppr_par_chapter).group(:cat_ppr_par_chapter_id)
                                 .map{ |c| ["#{c.cat_ppr_par_chapter.key}-#{c.cat_ppr_par_chapter.description}", c.value] }.to_h
  end

  def activities_obras
    @with_verifications_approved = ProjectActivityObra.with_verifications_approved
    @without_verifications_approved = ProjectActivityObra.without_verifications_approved

    @hash = Gmaps4rails.build_markers(@with_verifications_approved.to_a + @without_verifications_approved.to_a) do |activity_obra, marker|
      marker.lat activity_obra.latitude
      marker.lng activity_obra.longitude
    end
  end

end
