class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate_user
    redirect_to '/users/sign_in' unless current_user    
  end
end

