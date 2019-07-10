class Api
  def initialize(headers:)
    @headers = headers
  end
  
  def conection
    conn = Faraday.new(:url => 'http://localhost:4000') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    headers(conn)
  end

  private

  def headers(conn)
    return conn if @headers.nil?
    conn.headers['access-token'] = @headers['access-token']
    conn.headers['client'] = @headers['client']
    conn.headers['uid'] = @headers['uid']
    conn
  end
end