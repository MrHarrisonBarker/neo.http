require 'utils'

class Message

  #generic-message = start-line
  #                  *(message-header CRLF)
  #                  CRLF
  #                  [ message-body ]
  #start-line      = Request-Line | Status-Line

  @_start_line = RequestLine | StatusLine
  @_message_header = nil
  @_message_body = nil

  def initialize(_start_line, _message_header, _message_body)
    @_start_line = _start_line
    @_message_body = _message_body
    @_message_header = _message_header
  end

  def to_s
    "#{@_start_line.to_s}#{@_message_header.to_s}#{Utils::CRLF}#{@_message_body}"
  end

end
