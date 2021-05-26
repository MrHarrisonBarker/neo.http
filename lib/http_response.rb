require_relative 'status_codes'
require_relative 'header'
require_relative 'utils'

class HttpResponse < Message

  # Response      = Status-Line
  # *(( general-header
  # | response-header
  # | entity-header ) CRLF)
  # CRLF
  # [ message-body ]

  def initialize(status_line, headers = Array::new, message = "")
    @_start_line      = status_line
    @_message_headers = headers
    @_message_body    = message
  end

  # def initialize(status, reason, headers = [], message = "")
  #   @_start_line = StatusLine::new(status, reason)
  #   @_message_headers = headers
  #   @_message_body = message
  # end

  def self.parse (request_lines)
    request_lines.each_with_index do |line, l|
      puts "[#{l}]: #{line}"
    end

    status_line = StatusLine.parse(request_lines[0])

    puts "status line -> #{status_line.to_s}"

    current_line = 1
    headers      = []
    message_body = ""

    until request_lines[current_line] == Utils::CRLF || request_lines[current_line].nil? || !request_lines[current_line].include?(":")
      puts "current line -> #{request_lines[current_line]}"

      new_header = Header.parse(request_lines[current_line])
      puts "parsed header #{new_header.to_s}"
      headers.push(new_header)

      current_line += 1
    end

    current_line += 1

    until request_lines[current_line] == nil
      puts "current message line -> #{request_lines[current_line]}"

      message_body += (request_lines[current_line])

      current_line += 1
    end

    HttpResponse::new(status_line, headers, message_body)
  end

end

class StatusLine

  # Status-Line = HTTP-Version SP Status-Code SP Reason-Phrase CRLF

  @_http_version  = ""
  @_status_code   = StatusCodes::BAD_REQUEST
  @_reason_phrase = ""

  def initialize (status_code, reason = "", version = "HTTP/1.1")
    @_status_code   = status_code
    @_reason_phrase = reason
    @_http_version  = version
  end

  def to_s
    "#{@_http_version.to_s}#{Utils::SP}#{@_status_code.to_s}#{Utils::SP}#{@_reason_phrase}#{Utils::CRLF}"
  end

  def self.parse(s)
    puts "parsing status line #{s}"

    parts = s.split(Utils::SP)

    version     = parts[0].chomp
    status_code = parts[1].chomp

    reason_phrase = ""
    unless parts[2].nil?
      (2..parts.length - 1).each { |i|
        if i == parts.length - 1
          reason_phrase += parts[i].chomp
        else
          reason_phrase += parts[i].chomp + Utils::SP
        end
      }
    end

    StatusLine::new(status_code, reason_phrase, version)
  end

end