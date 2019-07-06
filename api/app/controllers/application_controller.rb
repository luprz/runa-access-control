# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Renders

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do
    head :forbidden
  end

  protected

  # Sign up params permit
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password
                                               role registration])
  end

  private

  # Function to get current page
  def current_page
    @current_page = params[:page]
  end
end
