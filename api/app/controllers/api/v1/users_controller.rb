# frozen_string_literal: true

# Controller for users
class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  include Renders

  # Action for get all users
  def index
    users = User.all
    success(users)
  end
end
