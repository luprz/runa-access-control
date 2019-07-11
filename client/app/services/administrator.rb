class Administrator
  API = '/api/v1/administrators'

  def initialize(headers:)
    @headers = headers
  end

  def find(id)
    response = api.get do |req|
      req.url "#{API}/#{id}"
    end
    render(response.body)
  end

  def create(administrator)
    response = api.post do |req|
      req.url API
      req.params['administrator'] = params(administrator)
    end
    JSON.parse(response.body)
  end

  def update(id, administrator)
    response = api.patch do |req|
      req.url "#{API}/#{id}"
      req.params['administrator'] = params(administrator)
    end
    JSON.parse(response.body)
  end

  def destroy(id)
    response = api.delete do |req|
      req.url "#{API}/#{id}"
    end
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

  def params(administrator)
    {
      name: administrator['name'],
      email: administrator['email'],
      position: administrator['position'],
      password: administrator['password']
    }
  end
end