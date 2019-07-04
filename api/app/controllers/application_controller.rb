# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Renders

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do
    forbidden('You do not have access to this request')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                      keys: %i[name email password 
                                               role registration])
  end
end
