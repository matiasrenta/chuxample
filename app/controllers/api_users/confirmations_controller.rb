class ApiUsers::ConfirmationsController < Devise::ConfirmationsController

  protect_from_forgery with: :null_session

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      #respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
      render :json => {status: :ok, notice: flash[:notice]}
    else
      #respond_with(resource)
      render :json => {data: resource, status: :unprocessable_entity, errors: resource.errors.full_messages}
    end
  end

  protected
  def after_confirmation_path_for(resource_name, resource)
    api_user_root_path
  end
end