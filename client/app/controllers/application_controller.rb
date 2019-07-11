class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate_user
    unless current_user&.data&.attributes
      redirect_to '/users/sign_in'
    end
  end

  def authorize
    if current_user&.data&.type.eql?('employees')
      redirect_to employees_show_path(current_user.data.id)
    end
  end
end

