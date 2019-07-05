# frozen_string_literal: true

# General policy
class ApplicationPolicy
  # Block for permissions handler
  def loudly
    raise ArgumentError unless block_given?
    return true if yield

    raise Pundit::NotAuthorizedError
  end
end
