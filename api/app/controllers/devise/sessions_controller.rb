# frozen_string_literal: true

module Devise
  # Controller for authenticate user
  class SessionsController < DeviseController
    prepend_before_action :allow_params_authentication!, only: :create
    prepend_before_action :verify_signed_out_user, only: :destroy
    before_action :authenticate_user!, only: [:destroy, :verify_token]
    prepend_before_action only: [:create, :destroy] do
      request.env['devise.skip_timeout'] = true
    end

    include Renders

    # Sign in: create a user session
    def create
      byebug
      self.resource = User.find_by_email(params[:user][:email])
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      if resource && resource.valid_password?(params[:user][:password])
        sign_in(resource_name, resource)
        generate_token(resource)
        success(resource)
      else
        forbidden("Email or password don't match")
      end
    end

    # Sign out: close a user session
    def destroy
      destroy_token(@access_token)
      signed_out =
        (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      if signed_out && is_flashing_format?
        set_flash_message :notice, :signed_out
      end
      message('Session has beed closed successfully')
    end

    private

    # Check if there is no signed in user before doing the sign out.
    #
    # If there is no signed in user, it will set the flash message and redirect
    # to the after_sign_out path.
    def verify_signed_out_user
      if all_signed_out?
        set_flash_message :notice, :already_signed_out if is_flashing_format?
      end
    end

    def all_signed_out?
      users = Devise.mappings.keys.map do |s|
        warden.user(scope: s, run_callbacks: false)
      end

      users.all?(&:blank?)
    end

    def generate_token(resource)
      access_token = SecureRandom.hex(20)
      resource.update(access_token: access_token)
    end

    def destroy_token(access_token)
      resource = User.find_by_access_token(access_token)
      resource.update(access_token: nil)
    end

    # Function for validate access token
    def authenticate_user!
      @access_token = request.headers['access-token']
      if @access_token 
        return if User.exists?(access_token: @access_token)
        forbidden('User not allowed')
      else
        bad_request('Access token is require')
      end
    end
  end
end
