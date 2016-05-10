class V1::VerificationsController < V1::BaseController
  respond_to :json

  def create
    respond_with Verification.create(verification_params)
  end

  private

    # Only allow a trusted parameter "white list" through.
    def verification_params
      params.require(:verification).permit({verification_photos_attributes: [:id, :url, :date_and_time, :latitude, :longitude]}, :user_id, :project_activity_obra_id, :answer, :evaluation, :comments, :status)
    end
end
