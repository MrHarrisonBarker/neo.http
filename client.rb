require_relative 'lib/http_client'

s = HttpClient::new

while line = s.next # Read lines from socket
  puts line         # and print them
end

s.close             # close socket when done