# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include Renders

  # Function for validate access token
  def authenticate_user!
    return if User.exists?(access_token: request.headers['access-token'])
    forbidden('User not allowed')
  end
end
