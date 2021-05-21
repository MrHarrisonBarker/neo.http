require './lib/http_server'

server = HttpServer::new

while req = server.next
  puts req
end