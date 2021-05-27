require_relative 'message'
require_relative 'header'

class HttpRequest < Message

  # Request       = Request-Line
  # *(( general-header
  # | request-header
  # | entity-header ) CRLF)
  # CRLF
  # [ message-body ]

  # def initialize(request_line, headers = Array::new, message = "")
  #   @_start_line      = request_line
  #   @_message_headers = headers
  #   @_message_body    = message
  # end

  def initialize(method, uri, body = "", headers = Array::new, default_headers = true)
    @_start_line   = RequestLine::new method, uri
    @_message_body = body

    if default_headers
      @_message_headers = HttpRequest.default_headers.concat(headers)
    else
      @_message_headers = Array::new.concat(headers)
    end
  end

  # def self.new(method, uri, body = "", default_headers = true)
  #   start_line = RequestLine::new method, uri
  #
  #   if default_headers
  #     headers = self.default_headers
  #   else
  #     headers = Array::new
  #   end
  #
  #   HttpRequest::new(start_line, headers, body)
  # end

  def self.default_headers
    [RequestHeaders::Accept::new, RequestHeaders::AcceptCharset::new, RequestHeaders::AcceptEncoding::new, RequestHeaders::AcceptLanguage::new, GenericHeaders::Connection::new, GenericHeaders::CacheControl::new, RequestHeaders::UserAgent::new]
  end

  def self.parse(lines)
    lines.each_with_index do |line, l|
      puts "[#{l}]: #{line}"
    end

    request_line = RequestLine.parse(lines[0])

    puts "request line -> #{request_line.to_s}"

    current_line = 1

    headers, current_line = self.parse_headers(lines, current_line)

    current_line += 1

    message_body, _ = self.parse_body(lines, current_line)

    req             = HttpRequest::new(nil, nil, message_body, headers, false)
    req._start_line = request_line

    req
  end
end

class RequestLine

  attr_accessor :_method, :_request_uri, :_http_version
  # Request-Line   = Method SP Request-URI SP HTTP-Version CRLF

  @_method       = nil
  @_request_uri  = nil
  @_http_version = nil

  def initialize (method, uri, version = "HTTP/1.1")
    @_method       = method
    @_request_uri  = uri
    @_http_version = version
  end

  def to_s
    "#{@_method.to_s}#{Utils::SP}#{@_request_uri.to_s}#{Utils::SP}#{@_http_version.to_s}#{Utils::CRLF}"
  end

  def self.parse(s)
    puts "parsing request line #{s}"

    parts = s.split(Utils::SP)

    method      = parts[0]
    request_uri = parts[1]
    version     = parts[2].chomp

    RequestLine::new(method, request_uri, version)
  end
end