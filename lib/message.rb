require_relative 'utils'
require_relative 'header'

class Message

  attr_accessor :_start_line, :_message_headers, :_message_body

  #generic-message = start-line
  #                  *(message-header CRLF)
  #                  CRLF
  #                  [ message-body ]
  #start-line      = Request-Line | Status-Line

  @_start_line      = nil
  @_message_headers = Array::new
  @_message_body    = nil

  def initialize(_start_line, _message_headers = Array::new, _message_body = nil)
    @_start_line      = _start_line
    @_message_body    = _message_body
    @_message_headers = _message_headers
  end

  def add_body(body)
    @_message_body = body
  end

  def add_header(header)
    @_message_headers << header
  end

  def to_s

    headers = ""
    @_message_headers.each { |header|
      headers += (header.to_s + Utils::CRLF)
    }

    "#{@_start_line.to_s}#{headers}#{Utils::CRLF}#{@_message_body}"
  end

  def self.parse_headers(lines, current_line)
    headers = []
    until lines[current_line] == Utils::CRLF || lines[current_line].nil? || !lines[current_line].include?(":")
      puts "current line -> #{lines[current_line]}"

      new_header = Header.parse(lines[current_line])
      puts "parsed header #{new_header.to_s}"
      headers.push(new_header)

      current_line += 1
    end
    return headers, current_line
  end

  def self.parse_body(lines,current_line)
    message_body = ""
    until lines[current_line] == nil
      puts "current message line -> #{lines[current_line]}"

      message_body += (lines[current_line])

      current_line += 1
    end
    return message_body, current_line
  end

end