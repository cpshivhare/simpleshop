class Api::RegistrationsController < Devise::RegistrationsController
  include ApiResponse

  respond_to :json

  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :current_password)
    end
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render_200(
        message: 'Signed up sucessfully.',
        data: ActiveModelSerializers::SerializableResource.new(resource, adapter: :json)
      )
    else
      render_422("User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}")
    end
  end
end
