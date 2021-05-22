# require './lib/http_server'
#
# server = HttpServer::new
#
# loop do
#   puts server.next
# end

require 'socket'

server = TCPServer.new 8080 # Server bind to port 2000
loop do
  session = server.accept # Wait for a client to connect

  request = session.gets.chomp
  puts request

  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: text/html\r\n"
  session.print "\r\n"
  session.print "Hello world! The time is #{Time.now}"

  # client.puts "Hello !"
  # client.puts "Time is #{Time.now}"
  session.close
end
