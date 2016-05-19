class ApiUserWellcomeController < ActionController::Base
  layout 'application'
  protect_from_forgery with: :null_session

  def wellcome
  end
end
