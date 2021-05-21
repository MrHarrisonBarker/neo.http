require 'socket'

class Main
  @something = 10
  @inst      = 20

  def initialize(x)
    puts('initializing main')
    @something = x
  end

  attr_reader :something
end

puts('Hello World!')

s = TCPServer.new "localhost", 8080

loop do
  client = s.accept # Wait for a client to connect
  puts "client connected #{client.addr false}"
  client.puts "Hello !"
  client.puts "Time is #{Time.now}"
  client.close
end

# s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
#
# Socket.tcp_server_loop 8080 do |socket, client_addr|
#   begin
#     puts "client connected #{client_addr}"
#     # IO.copy_stream(socket,socket)
#   ensure
#     socket.close
#   end
# end