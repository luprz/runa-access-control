class Operation
  API = '/api/v1/operations'

  def initialize(headers:)
    @headers = headers
  end

  def check(employee_id)
    response = api.post do |req|
      req.url "#{API}/check"
      req.params['operation'] = params(employee_id)
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

  def params(employee_id)
    {
      employee_id: employee_id,
      note: ''
    }
  end
end