class User
  API = '/api/v1/'

  def initialize(headers:, user:)
    @headers = headers
    @user = user
  end

  def data
    response = api.get do |req|
                 req.url "#{API}#{user_type}/#{@user['id']}"
               end
    JSON.parse(response.body, object_class: OpenStruct)
  end

  private

  def user_type
    @user['type'].pluralize
  end

  def api
    api = Api.new(headers: @headers)
    api.conection
  end
end