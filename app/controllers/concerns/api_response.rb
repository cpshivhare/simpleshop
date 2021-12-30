require 'active_support/concern'

module ApiResponse
  def render_401(message = 'Unauthorized.')
    render json: {
      status: 401,
      message: message
    }, status: :unauthorized
  end

  def render_200(message: 'successfully.', data: {})
    render json: {
      message: message,
      data: data
    }, status: :ok
  end

  def render_422(message = 'Unprocessable Entity.')
    render json: {
      message: message
    }, status: :unprocessable_entity
  end

  def record_not_unique(message)
    render json: {
      errors: [
        {
          status: '400',
          title: message
        }
      ]
    }, status: 400
  end

  def not_found
    render json: {
      errors: [
        {
          status: 404,
          title: 'Not Found'
        }
      ]
    }, status: 404
  end

  def record_invalid(message)
    render json: {
      errors: [
        {
          status: '400',
          title: message
        }
      ]
    }, status: 400
  end

  def record_not_saved(message)
    render json: {
      errors: [
        {
          status: '400',
          title: message
        }
      ]
    }, status: 400
  end
end
