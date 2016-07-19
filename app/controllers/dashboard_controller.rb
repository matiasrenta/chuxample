class DashboardController < ApplicationController

  def index
    authorize! :read, :dashboard
    set_content_title('fa-fw fa fa-dashboard', ['Dashboard'])
    presupuesto
    documentos
    suppliers
    afectaciones
  end

  private

  def presupuesto
    @pre_total             = KeyAnalytical.sum(:modificado)
    #@pre_by_chapter        = KeyAnalytical.select('sum(modificado) as value, cat_ppr_par_chapter_id').includes(:cat_ppr_par_chapter).group(:cat_ppr_par_chapter_id)
    #@pre_by_chapter        = KeyAnalytical.select('CONCAT(cat_ppr_par_chapters.key, " ", cat_ppr_par_chapters.description)').includes(:cat_ppr_par_chapter).group('cat_ppr_par_chapters.id, cat_ppr_par_chapters.key, cat_ppr_par_chapters.description').sum(:modificado)

    @pre_by_chapter        = KeyAnalytical.select('sum(modificado) as value, cat_ppr_par_chapter_id')
                                 .includes(:cat_ppr_par_chapter).group(:cat_ppr_par_chapter_id)
                                 .map{ |c| ["#{c.cat_ppr_par_chapter.key}-#{c.cat_ppr_par_chapter.description}", c.value] }
                                 .to_h

    @pre_by_area           = KeyAnalytical.select('sum(modificado) as value, cat_are_area_id').includes(:cat_are_area).group(:cat_are_area_id)
    @pre_by_project_type   = KeyAnalytical.select('sum(modificado) as value, project_type').group(:project_type)
    @pre_by_funding_source = KeyAnalytical.select('sum(modificado) as value, cat_fon_funding_source_id').includes(:cat_fon_funding_source).group(:cat_fon_funding_source_id)
    @pre_by_expense_type   = KeyAnalytical.select('sum(modificado) as value, cat_ppr_expense_type_id').includes(:cat_ppr_expense_type).group(:cat_ppr_expense_type_id)
  end

  def documentos
    @doc_total = FinancialDocument.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
    @doc_obras = FinancialDocument.obras.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
    @doc_socials = FinancialDocument.socials.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
    @doc_nominas = FinancialDocument.nominas.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
    @doc_adquisicions = FinancialDocument.adquisicions.select('count(*) as value, financial_document_type_id').includes(:financial_document_type).group(:financial_document_type_id)
  end

  def suppliers
    @sup_total = FinancialDocument.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
    @sup_obras = FinancialDocument.obras.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
    @sup_socials = FinancialDocument.socials.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
    @sup_adquisicions = FinancialDocument.adquisicions.bills_and_contracts.without_contract.select('sum(monto) as value, supplier_id').includes(:supplier).group(:supplier_id)
  end

  def afectaciones
    @afe_total = KeyAnalytical.con_afectaciones.count
    @afe_obras = KeyAnalytical.con_afectaciones.obras.count
    @afe_socials = KeyAnalytical.con_afectaciones.socials.count
    @afe_nominas = KeyAnalytical.con_afectaciones.nominas.count
    @afe_adquisicions = KeyAnalytical.con_afectaciones.adquisicions.count
  end

end
