class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    @employees = []
  end
end
