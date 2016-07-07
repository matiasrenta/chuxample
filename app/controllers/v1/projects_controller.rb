class V1::ProjectsController < V1::BaseController
  respond_to :json

  def index
    @projects = KeyAnalytical.select(:id, :autorizado).group(:project_type).sum(:autorizado)
    respond_with @projects
  end

  def portal_treemap
    @projects = KeyAnalytical.joins(:cat_ppr_par_partida_especifica,
                                       :cat_ppr_par_chapter,
                                       :cat_aci_institutional_activity,
                                       :cat_are_area).select('cat_ppr_par_partida_especificas.key as codigo_ptda,
                                                              cat_ppr_par_partida_especificas.description as concepto,
                                                              cat_ppr_par_chapters.key as codigo_capitulo,
                                                              cat_ppr_par_chapters.description as capitulo,
                                                              cat_aci_institutional_activities.description as actividad_institucional,
                                                              cat_are_areas.description as area,
                                                              key_analyticals.autorizado as programado')
    respond_with @projects
  end

end
