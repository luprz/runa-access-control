# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include Renders

  private
  
  # Function for validate access token
  def authenticate_user!
    if request.headers['access-token']
      return if User.exists?(access_token: request.headers['access-token'])
      forbidden('User not allowed')
    else
      bad_request('Access token is require')
    end
  end
end
