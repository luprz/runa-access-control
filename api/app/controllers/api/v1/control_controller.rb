# frozen_string_literal: true

module Api
  module V1
    # Controller for control index
    class ControlController < ApplicationController
      before_action :authenticate_user!

      # Control Index: here getting a employees list
      # and the admin will can check in or check out
      # a employee
      def index
        policy.index?
        message('Ready')
      end

      private

      def policy
        @policy ||= ControlPolicy.new(user: current_user)
      end
    end
  end
end
