require 'socket'
# require_relative 'lib/http_client'

# s = HttpClient::new

s = TCPSocket.new 'localhost', 8080

s.each {|line| puts "#{s.lineno}: #{line}" }

# while line = s.gets # Read lines from socket
#   puts line         # and print them
# end

s.close             # close socket when done