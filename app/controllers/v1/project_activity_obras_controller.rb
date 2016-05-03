class V1::ProjectActivityObrasController < V1::BaseController
  respond_to :json

  def index
    @project_activity_obras = ProjectActivityObra.all
    respond_with @project_activity_obras
  end

end
