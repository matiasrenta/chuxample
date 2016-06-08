class V1::ProjectActivityObrasController < V1::BaseController
  respond_to :json

  def index
    # TODO: debería poderse verificar más de una vez una activity por el mismo usuario, despues que haya pasado x dias de la ultima verificacion (15 dias)
    # y deberían enviarse las activities con un campo datetime 'verificada_at' para que se muestren primero las nunca verificadas
    user_verifications = Verification.select(:project_activity_obra_id).by_user(current_user).validas_or_sin_revisar
    @project_activity_obras = ProjectActivityObra.where('id NOT IN (?)', user_verifications.size > 0 ? user_verifications.pluck(:project_activity_obra_id).uniq : 0)
    respond_with @project_activity_obras
  end

end
