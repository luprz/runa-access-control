class Administrator
  API = '/api/v1/administrators'

  def initialize(headers:)
    @headers = headers
  end

  def employees(id)
    response = api.get do |req|
      req.url "#{API}/#{id}/employees"
    end
    render(response.body)
  end

  def operations(id)
    response = api.get do |req|
      req.url "#{API}/#{id}/operations"
    end
    render(response.body)
  end

  private

  def api
    api = Api.new(headers: @headers)
    api.conection
  end

  def render(response)
    JSON.parse(response, object_class: OpenStruct)
  end
end