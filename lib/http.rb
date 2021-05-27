require_relative 'methods'
require_relative 'http_request'
require_relative 'http_response'
require_relative 'header'

# request = "GET\x20/\x20HTTP/1.0\r\nHost: localhost:8080\r\nAccept: */*\r\n\r\n"

class Http

  @_host = nil
  @_port = nil

  def initialize(host = "localhost", port = "80")
    @_host = host
    @_port = port
  end

  def response(request)
    TCPSocket.open(@_host, @_port) { |s|
      puts "sending \n#{request}\n"

      s.send (request), 0

      ready = IO.select([s], nil, nil, 10)

      if ready.nil?
        puts "FUCK you"
      end

      raw_response = s.readlines

      HttpResponse.parse(raw_response)
    }
  end

  def send(method, uri, default_headers)
    HttpRequest::new(method, uri, default_headers)
  end

  def get(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

  def get_response(uri)
    response(get(uri).to_s)
  end

  def post(uri, body)
    req = HttpRequest::new(Methods::POST, uri, true)
    req.add_body(body)
    req
  end

  def post_response(uri, body)
    response(post(uri, body).to_s)
  end

  def put(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

  def delete(uri)
    HttpRequest::new(Methods::GET, uri, true)
  end

  def start

  end

end
