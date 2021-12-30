class Api::SessionsController < Devise::SessionsController
  include ApiResponse
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render_200(
      message: 'Logged in sucessfully.',
      data: ActiveModelSerializers::SerializableResource.new(resource, adapter: :json).as_json
    )
  end

  def respond_to_on_destroy
    return render_401("Couldn't find an active session.") if user_signed_in?


    render_200(message: 'logged out successfully')
  end
end
