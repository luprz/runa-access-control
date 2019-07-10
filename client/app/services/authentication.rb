class Authentication
  SIGN_IN = '/api/v1/users/sign_in'
  SIGN_OUT = '/api/v1/users/sign_out'

  def initialize(user = {}, headers={})
    @email = user[:email]
    @password = user[:password]
    @headers = headers
  end

  def sign_in
    response = api.post do |req|
                req.url SIGN_IN
                req.body = {
                  email: @email,
                  password: @password 
                } 
              end
  end

  def sign_out(headers)
    api = api_with_headers(headers)
    response = api.delete do |req|
                req.url SIGN_OUT
              end
  end

  private

  def api
    api = Api.new(headers: nil)
    api.conection
  end

  def api_with_headers(headers)
    api = Api.new(headers: headers)
    api.conection
  end
end