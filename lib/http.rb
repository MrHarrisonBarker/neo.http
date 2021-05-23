require_relative 'methods'
require_relative 'http_request'
require_relative 'header'

class Http

  def get(uri)
    req = HttpRequest.new(Methods::GET, uri)
    puts req
  end

end
