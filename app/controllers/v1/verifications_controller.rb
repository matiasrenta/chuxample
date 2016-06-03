class V1::VerificationsController < V1::BaseController
  respond_to :json

  # estas son las verificaciones realizadas por el usuario
  def index
    @verifications = Verification.all
    respond_with @verifications
  end

  def create
    # {verification_photos_attributes: [:id, :url, :date_and_time, :latitude, :longitude]}
    verification = Verification.new(verification_params)
    ActiveSupport::JSON.decode(verification.photos).each do |photo|
      verification.verification_photos << VerificationPhoto.new(photo)
    end
    verification.save
    respond_with verification
  end

  private

    # Only allow a trusted parameter "white list" through.
    def verification_params
      params.require(:verification).permit(:photos, :user_id, :project_activity_obra_id, :answer, :evaluation, :comments, :status)
    end
end
