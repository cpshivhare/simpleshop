class Api::BaseController < ApplicationController
  include ApiResponse

  rescue_from Pundit::NotAuthorizedError, with: :render_422
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  rescue_from ActiveRecord::RecordNotSaved, with: :record_not_saved

  after_action :verify_authorized, expect: :index, unless: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  respond_to :json
end
