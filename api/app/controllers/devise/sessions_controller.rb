# frozen_string_literal: true

module Devise
  # Controller for authenticate user
  class SessionsController < DeviseController
    prepend_before_action :allow_params_authentication!, only: :create
    prepend_before_action :verify_signed_out_user, only: :destroy
    prepend_before_action only: [:create, :destroy] do
      request.env['devise.skip_timeout'] = true
    end

    include Renders

    # Sign in: create a user session
    def create
      self.resource = User.find_by_email(params[:user][:email])
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      if resource && resource.valid_password?(params[:user][:password])
        sign_in(resource_name, resource)
        generate_token(resource)
        success(resource)
      else
        forbidden('User not allowed')
      end
    end

    # Sign out: close a user session
    def destroy
    end

    protected

    def sign_in_params
      devise_parameter_sanitizer.sanitize(:sign_in)
    end

    def serialize_options(resource)
      methods = resource_class.authentication_keys.dup
      methods = methods.keys if methods.is_a?(Hash)
      methods << :password if resource.respond_to?(:password)
      { methods: methods, only: [:password] }
    end

    def auth_options(params)
      if params[:user].has_key?(:path)
        { scope: resource_name, recall: params[:user][:path] }
      else
        { scope: resource_name, recall: "#{controller_path}#new" }
      end
    end

    def translation_scope
      'devise.sessions'
    end

    private

    # Check if there is no signed in user before doing the sign out.
    #
    # If there is no signed in user, it will set the flash message and redirect
    # to the after_sign_out path.
    def verify_signed_out_user
      if all_signed_out?
        set_flash_message :notice, :already_signed_out if is_flashing_format?

        respond_to_on_destroy
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

    def destroy_token(resource)
      resource.update(access_token: nil)
    end
  end
end
