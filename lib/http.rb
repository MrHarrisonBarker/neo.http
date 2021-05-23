require_relative 'methods'
require_relative 'http_request'
require_relative 'header'

class Http

  @_host = nil
  @_port = nil

  def initialize(host, port)
    @_host = host
    @_port = port
  end

  def send(method, uri, default_headers)
    HttpRequest::new(method, uri, default_headers)
  end

  def get(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

  def get_response(uri)
    TCPSocket.open(@_host, @_port) { |s|
      # request = get(uri).to_s
      request = "GET / HTTP/1.0\r\n\r\nHost: localhost:8080\r\n"
      puts "sending \n#{request}\n"
      s.send (request), 0
      return s.read
    }
  end

  def post(uri, body)
    req = HttpRequest::new(Methods::POST, uri, true)
    req.add_body(body)
    req
  end

  def put(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

  def delete(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

end
