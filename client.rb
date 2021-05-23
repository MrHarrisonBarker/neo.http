require 'socket'
require_relative 'lib/http'
require_relative 'lib/uri'

# s = HttpClient::new
#
# s = TCPSocket.new 'localhost', 8080
#
# s.send Http::new::get(URI::new("/")).to_s, 0

# TCPSocket.open("localhost", 8080) {|s|
#   # req = "GET / HTTP/1.1\r\n\rHost:localhost:8080\r\n"
#
#   req = Http::new::post(URI::new("/"),"value=val&another=value").to_s
#
#   # req = Http::new::get(URI::new("/")).to_s
#   puts req
#   s.send req, 0
#   p s.read
# }

# s.each {|line| puts "#{s.lineno}: #{line}" }

# while line = s.gets # Read lines from socket
#   puts line         # and print them
# end

# s.close             # close socket when done

puts Http::new("localhost", 8080)::get_response("/")