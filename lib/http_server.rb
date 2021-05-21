require 'socket'

module IHttpServer
  def start
    "Not Implemented"
  end

  def next
    "Not Implemented"
  end

  def close
    "Not Implemented"
  end
end

class HttpServer
  include IHttpServer

  @Socket = nil

  def next
    client = @Socket.accept

    client.puts "Hello world!"
    client.puts "Time is #{Time.now}"

    _client_addr = client.addr

    client.close
    _client_addr
  end

  def initialize(port = 8080)
    @Socket = TCPServer::new port
  end

end