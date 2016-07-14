class V1::PortalController < V1::BaseController
  respond_to :json

  def index
    @suppliers = KeyAnalytical.select(:id, :modificado).group(:project_type).sum(:modificado)
    respond_with @projects
  end

  def total_budget
    render json: {presupuesto: KeyAnalytical.sum(:modificado), percent: 7, last_year: 2015}
  end

  def treemap
    @projects = KeyAnalytical.joins(:cat_ppr_par_partida_especifica,
                                    :cat_ppr_par_chapter,
                                    :cat_aci_institutional_activity,
                                    :cat_are_area).select('cat_ppr_par_partida_especificas.key as codigo_ptda,
                                                              cat_ppr_par_partida_especificas.description as concepto,
                                                              cat_ppr_par_chapters.key as codigo_capitulo,
                                                              cat_ppr_par_chapters.description as capitulo,
                                                              cat_aci_institutional_activities.description as actividad_institucional,
                                                              cat_are_areas.description as area,
                                                              key_analyticals.original as programado')
    respond_with @projects
  end

  def suppliers
    adquisiciones = FinancialDocument.bills.adquisicions.select("SUM(monto) AS value, suppliers.name AS name, 'Adquisiciones' AS tipo").joins(:supplier).group('suppliers.id, suppliers.name')
    obras         = FinancialDocument.bills.obras.select("SUM(monto) AS value, suppliers.name AS name, 'Obras' AS tipo").joins(:supplier).group('suppliers.id, suppliers.name')
    socials       = FinancialDocument.bills.socials.select("SUM(monto) AS value, suppliers.name AS name, 'Sociales' AS tipo").joins(:supplier).group('suppliers.id, suppliers.name')
    @suppliers = adquisiciones.union(obras.union(socials))
    respond_with @suppliers
  end

  def mapa_obras
    @activities_obras = ProjectActivityObra.all.includes(:financial_documents, :verifications, project_obra: [:cat_are_area])
  end

  def financial_documents
    @financial_documents = FinancialDocument.all.includes(:project_activityable, :financial_document_type)
  end

  def open_data
    @open_data = OpenDatum.order('updated_at DESC')
  end

end
