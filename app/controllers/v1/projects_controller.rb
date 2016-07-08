class V1::ProjectsController < V1::BaseController
  respond_to :json

  def index
    @projects = KeyAnalytical.select(:id, :autorizado).group(:project_type).sum(:autorizado)
    respond_with @projects
  end

end
