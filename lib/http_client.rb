require 'socket'

class HttpClient
  @Socket = nil

  def send
    "Not Implemented"
  end

  def close
    @Socket.close
    "Not Implemented"
  end

  def next
    @Socket.gets
  end

  def initialize(host = 'localhost', port = 8080)
    @Socket = TCPSocket.new host, port
  end
end
