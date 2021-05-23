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
    @_key   = key
    @_value = value
  end

  def to_s
    "#{@_key}:#{@_value}"
  end
end


module GenericHeaders

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
end