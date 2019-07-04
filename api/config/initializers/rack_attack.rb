# Allow only 300 requests every 30 seconds

Rack::Attack.throttle("requests by ip", limit: 300, period: 30.seconds) do |request|
  request.ip
end