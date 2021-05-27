require_relative 'methods'
require_relative 'http_request'
require_relative 'http_response'
require_relative 'header'
require 'socket'

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

  def send(method, uri, body = "", headers = Array::new, default_headers = false)
    HttpRequest::new(method, uri, body, headers, default_headers)
  end

  def get(uri, body = "", headers = Array::new)
    HttpRequest::new(Methods::GET, uri, body, headers, true)
  end

  def get_response(uri, body = "", headers = Array::new)
    response(get(uri, body, headers).to_s)
  end

  def post(uri, body, headers = Array::new)
    req = HttpRequest::new(Methods::POST, uri, body, headers, true)
    req.add_body(body)
    req
  end

  def post_response(uri, body = "", headers = Array::new)
    response(post(uri, body, headers).to_s)
  end

  def put(uri, body = "", headers = Array::new)
    HttpRequest::new(Methods::GET, uri, body, headers, true)
  end

  def put_response(uri, body = "", headers = Array::new)
    response(put(uri, body, headers).to_s)
  end

  def delete(uri, body = "", headers = Array::new)
    HttpRequest::new(Methods::GET, uri, body, headers, true)
  end

  def delete_response(uri, body = "", headers = Array::new)
    response(delete(uri, body, headers))
  end

  def start
    # Socket.tcp_server_loop @_port do |data,src|
    #   src.reply data
    # end
    server = TCPServer.new @_port

    p server
    puts "server started on port #{@_port}"

    loop do
      client = server.accept

      req_raw = client.recv(1024)
      puts "raw ->\n#{req_raw}"

      req = HttpRequest.parse(req_raw.split(Utils::CRLF))
      # req =  HttpRequest.parse(client.readlines)
      puts "Request: #{req}"

      res = HttpResponse.ok_result.to_s
      puts "Response: #{res}"

      client.print res

      # client.print "HTTP/1.1 200/OK\r\nContent-type: text/html\r\n\r\n"
      # client.print "<html><body><h1>#{Time.now}</h1></body></html>\r\n"
      client.close
    end
  end

end
