class WelcomeController < ApplicationController
  skip_authorization_check only: :index
  def index
    #todo: asegurar que todos puedan ver root_url o bien crear un permiso y darles acceso. En principio todos deberian ver un home correspondiente a su role
    #authorize! :read, User
    set_content_title('fa fa-lg fa-fw fa-cube', ['Welcome!'])
  end
end
