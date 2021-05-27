require_relative 'header'
require_relative 'utils'

class HttpResponse < Message

  attr_reader :_message_headers, :_message_body

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

  def self.default_headers
    [GenericHeaders::Date::new, GenericHeaders::Connection::new]
  end

  def self.parse (lines)
    lines.each_with_index do |line, l|
      puts "[#{l}]: #{line}"
    end

    status_line = StatusLine.parse(lines[0])

    puts "status line -> #{status_line.to_s}"

    current_line = 1

    headers, current_line = self.parse_headers(lines, current_line)

    current_line += 1

    message_body, _ = self.parse_body(lines, current_line)

    HttpResponse::new(status_line, headers, message_body)
  end

  def self.ok_result(reason = "OK")
    HttpResponse::new(StatusLine::new(:OK, reason), HttpResponse.default_headers)
  end

  def self.bad_request(reason = "BAD REQUEST")
    HttpResponse::new(StatusLine::new(:Bad_Request, reason), HttpResponse.default_headers)
  end

end

class StatusLine

  attr_reader :_status_code, :_reason_phrase

  # Status-Line = HTTP-Version SP Status-Code SP Reason-Phrase CRLF

  @_http_version  = ""
  @_status_code   = :Continue
  @_reason_phrase = ""

  def initialize (status_code, reason = "", version = "HTTP/1.1")
    @_status_code   = status_code
    @_reason_phrase = reason
    @_http_version  = version
  end

  def to_s
    "#{@_http_version.to_s}#{Utils::SP}#{Utils::STATUS_CODES[@_status_code]}#{Utils::SP}#{@_reason_phrase}#{Utils::CRLF}"
  end

  def self.parse(s)
    puts "parsing status line #{s}"

    parts = s.split(Utils::SP)

    version = parts[0].chomp

    status_code = Utils::STATUS_CODE_JUNC[parts[1].chomp.to_s]

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