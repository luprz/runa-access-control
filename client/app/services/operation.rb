class Operation
  API = '/api/v1/operations'

  def initialize(headers:)
    @headers = headers
  end

  def check_in(employee_id)
    response = api.post do |req|
      req.url "#{API}/check_in"
      req.params['operation'] = params(employee_id)
    end
    render(response.body)
  end

  def check_out(employee_id)
    response = api.post do |req|
      req.url "#{API}/check_out"
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