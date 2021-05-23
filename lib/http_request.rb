require_relative 'message'
require_relative 'header'

class HttpRequest < Message

  # Request       = Request-Line
  # *(( general-header
  # | request-header
  # | entity-header ) CRLF)
  # CRLF
  # [ message-body ]

  def initialize(method, uri, default_headers = true)
    @_start_line = RequestLine::new method, uri

    if default_headers
      @_message_headers = _default_headers
    else
      @_message_headers = Array::new
    end

  end

  def _default_headers
    [RequestHeaders::Accept::new, RequestHeaders::AcceptCharset::new, RequestHeaders::AcceptEncoding::new, RequestHeaders::AcceptLanguage::new, GenericHeaders::Connection::new, GenericHeaders::CacheControl::new, RequestHeaders::UserAgent::new]
  end
end

class RequestLine

  # Request-Line   = Method SP Request-URI SP HTTP-Version CRLF

  @_method       = nil
  @_request_uri  = nil
  @_http_version = nil

  def initialize (method, uri, version = "1.1")
    @_method       = method
    @_request_uri  = uri
    @_http_version = version
  end

  def to_s
    "#{@_method.to_s}#{Utils::SP}#{@_request_uri.to_s}#{Utils::SP}HTTP/#{@_http_version.to_s}#{Utils::CRLF}"
  end
end