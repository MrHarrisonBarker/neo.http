require_relative 'utils'

class Message

  attr_reader :_message_headers

  #generic-message = start-line
  #                  *(message-header CRLF)
  #                  CRLF
  #                  [ message-body ]
  #start-line      = Request-Line | Status-Line

  @_start_line     = nil
  @_message_headers = Array::new
  @_message_body   = nil

  def initialize(_start_line, _message_headers = Array::new, _message_body = nil)
    @_start_line     = _start_line
    @_message_body   = _message_body
    @_message_headers = _message_headers
  end

  def add_body(body)
    @_message_body = body
  end

  def add_header(header)
    @_message_headers << header
  end

  def to_s
    "#{@_start_line.to_s}\r#{@_message_headers.join(Utils::CRLF)}#{Utils::CRLF}#{@_message_body}"
  end

end