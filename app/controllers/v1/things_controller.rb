class V1::ThingsController < V1::BaseController
  respond_to :json
  protect_from_forgery with: :null_session
  skip_authorization_check #todo: realmente queremos saltar la autorización de cancan?
  skip_before_action :authenticate_user!
  before_action :authenticate_user_with_http_basic

  def index
    @things = Thing.all
    respond_with @things
  end

  def show
    respond_with Thing.find(params[:id])
  end

  def create
    respond_with Thing.create(thing_params)
  end

  def update
    respond_with Thing.update(params[:id], thing_params)
  end

  def destroy
    respond_with Thing.destroy(params[:id])
  end

  private

  # Only allow a trusted parameter "white list" through.
  def thing_params
    params.require(:thing).permit(:name, :age, :price, :expires, :discharged_at, :description, :published, :gender)
  end

  def authenticate_user_with_http_basic
    authenticate_or_request_with_http_basic('api') do |username, password|
      user = User.find_by_email username
      user && user.valid_password?(password)
    end
  end
end
