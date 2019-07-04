module ControllerSpecHelper

  def sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  def sign_out(resource)
    # logout(warden_scope(resource))
  end

end
