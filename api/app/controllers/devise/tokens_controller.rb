# frozen_string_literal: true

module Devise
  # Controller for tokens handler
  class TokensController < ApplicationController
    def verify_token
      access_token = request.headers['access-token']
      response = User.exists?(access_token: access_token)
      success({access_token: access_token, active: response})
    end
  end
end