class ApplicationPolicy
  def loudly
    raise ArgumentError unless block_given?
    return true if yield

    raise Pundit::NotAuthorizedError
  end
end
