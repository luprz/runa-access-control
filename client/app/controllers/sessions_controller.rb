class SessionsController < ApplicationController
  before_action :authenticate_user, only: :destroy
  
  def new; end

  def create
    response = auth.sign_in
    if response.status.eql?(200)
      create_session(response)
      redirect_to root_path
    else
      add_errors(response)
      render :new
    end
  end

  def destroy
    auth = ::Authentication.new
    response = auth.sign_out(session[:headers])
    session[:headers] = nil
    session[:user] = nil
    redirect_to sessions_sign_in_path
  end

  private

  # Params object permit
  def sessions_params
    params.require(:sessions).permit(
      :email, :password
    )
  end

  def auth
    ::Authentication.new(sessions_params)
  end

  def create_session(response)
    headers = response.headers
    user = JSON.parse(response.body)
    session[:headers] = indiferent_hash(headers)
    session[:user] = indiferent_hash(user)
  end
  
  def indiferent_hash(hash={})
    ActiveSupport::HashWithIndifferentAccess.new(hash)
  end

  def add_errors(response)
    notice = JSON.parse(response.body)
    flash[:notice] = notice['errors'].first
  end
end
