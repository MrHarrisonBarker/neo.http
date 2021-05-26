class Header

  # message-header = field-name ":" [ field-value ]
  # field-name     = token
  # field-value    = *( field-content | LWS )
  # field-content  = <the OCTETs making up the field-value
  # and consisting of either *TEXT or combinations
  # of token, separators, and quoted-string>

  @_key   = nil
  @_value = nil

  def initialize (key, value)
    puts("new header init #{key},#{value}")
    @_key   = key
    @_value = value
  end

  def to_s
    if @_key == nil or @_value == nil
      return nil
    end
    "#{@_key}: #{@_value}"
  end

  def self.parse(s)
    puts "parsing header #{s}"
    key_value = s.split(":")
    Header::new(key_value[0].chomp, key_value[1].chomp)
  end

end

module GenericHeaders
  class CacheControl < Header
    def initialize(value = "max-age=0")
      @_key   = "Cache-Control"
      @_value = value
    end
  end

  class Connection < Header
    def initialize(value = "keep-alive")
      @_key   = "Connection"
      @_value = value
    end
  end
end

module RequestHeaders
  class Accept < Header
    def initialize(value = "*/*")
      @_key   = "Accept"
      @_value = value
    end
  end

  class AcceptCharset < Header
    def initialize(value = "utf-8")
      @_key   = "Accept-Charset"
      @_value = value
    end
  end

  class AcceptEncoding < Header
    def initialize(value = "*")
      @_key   = "Accept-Encoding"
      @_value = value
    end
  end

  class AcceptLanguage < Header
    def initialize(value = "en,en-us")
      @_key   = "Accept-Language"
      @_value = value
    end
  end

  class UserAgent < Header
    def initialize
      @_key   = "User-Agent"
      @_value = "http.neo/0.1"
    end
  end
end