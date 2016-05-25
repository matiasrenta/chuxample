class ApiUsers::WelcomeController < ActionController::Base
  #layout 'application'
  protect_from_forgery with: :null_session

  def welcome
    if api_user_signed_in?
      sign_out(:api_user)
      #redirect_to new_user_session_path
    end
  end

end
