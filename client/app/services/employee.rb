class Employee
  API = '/api/v1/employees'

  def initialize(headers:)
    @headers = headers
  end

  def find(id)
    response = api.get do |req|
      req.url "#{API}/#{id}"
    end
    render(response.body)
  end

  def create(employee)
    response = api.post do |req|
      req.url API
      req.params['employee'] = params(employee)
    end
    JSON.parse(response.body)
  end

  def update(id, employee)
    response = api.patch do |req|
      req.url "#{API}/#{id}"
      req.params['employee'] = params(employee)
    end
    JSON.parse(response.body)
  end

  def destroy(id)
    response = api.delete do |req|
      req.url "#{API}/#{id}"
    end
  end

  private

  def api
    api = Api.new(headers: @headers)
    api.conection
  end

  def render(response)
    JSON.parse(response, object_class: OpenStruct)
  end

  def params(employee)
    {
      name: employee['name'],
      email: employee['email'],
      position: employee['position'],
      password: employee['password']
    }
  end
end