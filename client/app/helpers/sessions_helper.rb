module SessionsHelper
  def current_user
    return nil unless session[:user]
    user.data 
  end

  private

  def user
    User.new(
      headers: session[:headers],
      user: session[:user]['data']
    )
  end
end
