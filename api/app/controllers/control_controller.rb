# frozen_string_literal: true

# Controller for control index
class ControlController < ApplicationController
  include Renders

  # Control Index: here getting a employees list
  # and the admin will can check in or check out
  # a employee
  def index
    success('Ready')
  end
end
