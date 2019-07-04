# frozen_string_literal: true

# Concern to different types of
# renders according to their status
module Renders
  extend ActiveSupport::Concern

  private

  # If request is success
  def success(object)
    render json: object, status: 200
  end

  # If request no found
  def no_found(message)
    render json: {
      errors: message,
      status: :no_found
    }, status: 404
  end

  # If request is a bad request
  def bad_request(message)
    render json: {
      errors: message,
      status: :bad_request
    }, status: 400
  end

  # If request is don't have access
  def forbidden(message)
    render json: {
      errors: message,
      status: :forbidden
    }, status: 403
  end

  # If request is not authorized
  def unauthorized(message)
    render json: {
      errors: message,
      status: :unauthorized
    }, status: 401
  end
end
