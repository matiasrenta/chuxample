class V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :restrict_applications_access
  before_action :authenticate_user_or_api_user_or_social_user
  before_action :check_if_api_user_active
  #before_action :set_user_time_zone

  protected

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end

  private

  def restrict_applications_access
    api_key = ApiKey.find_by_access_token(request.headers['HTTP_ACCESS_TOKEN']) # el header original es 'access_token', pero rails 4 lo transforma a HTTP_ACCES_TOKEN (uppercase, underscore and prefixed with HTTP)
    head :unauthorized unless api_key
  end


  def authenticate_user_or_api_user_or_social_user
    if request.headers['HTTP_AUTHORIZATION'].present?
      # users or api_user are authenticated with http basic auth
      authenticate_with_http_basic do |username, password|
        user = User.find_by_email username
        if user && user.valid_password?(password)
          @user = user
          return true
        end

        api_user = ApiUser.find_by_email username
        if api_user && api_user.valid_password?(password)
          @api_user = api_user
          return true
        end

        head :unauthorized
      end
    elsif request.headers['HTTP_SOCIAL_USER'].present?
      # aqui solo debo ver si existe el provider/uid. Si no existe lo agrego.
      # Al no haber password, se debe confiar que la application (por ejemplo una aplicacion movil)
      # haya hecho el login con el provider correctamente. Por eso es importante primero validar la ApiKey, sino cualquiera
      # podria entrar pasando un provider/uid (inventado o peor aun el de otra persona)
      head :unauthorized
    else
      head :unauthorized
    end
  end

  def check_if_api_user_active
    if @api_user && @api_user.confirmed_at.blank?
      render :json => {data: @api_user, status: :unprocessable_entity, errors: ['Usuario no activado. Debe confirmar su cuenta visitando el enlace enviado a su email.']}
    end
  end

end
