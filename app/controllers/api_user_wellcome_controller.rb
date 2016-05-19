class ApiUserWellcomeController < ActionController::Base
  layout 'application'
  protect_from_forgery with: :null_session

  def wellcome
    @content_title = Hash.new
  end
end
