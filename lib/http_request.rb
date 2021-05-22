class HttpRequest < Message
  def initialize
    @_start_line = RequestLine::new
  end
end

class RequestLine
  @_method = Methods::GET
  @_request_uri = nil
  @_http_version = nil
end