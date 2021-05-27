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

  class Authorization < Header
    def initialize(value)
      @_key   = "Authorization"
      @_value = value
    end
  end

  class Expect < Header
    def initialize(value)
      @_key   = "Expect"
      @_value = value
    end
  end

  class From < Header
    def initialize(value)
      @_key   = "From"
      @_value = value
    end
  end

  class Host < Header
    def initialize(uri)
      @_key   = "Host"
      @_value = uri
    end
  end

  class IfMatch < Header
    def initialize(value)
      @_key   = "If-Match"
      @_value = value
    end
  end

  class IfModifiedSince < Header
    def initialize(value)
      @_key   = "If-Modified-Since"
      @_value = value
    end
  end

  class IfNoneMatch < Header
    def initialize(value)
      @_key   = "If-None-Match"
      @_value = value
    end
  end

  class IfRange < Header
    def initialize(value)
      @_key   = "If-Range"
      @_value = value
    end
  end

  class IfUnmodifiedSince < Header
    def initialize(value)
      @_key   = "If-Unmodified-Since"
      @_value = value
    end
  end

  class MaxForwards < Header
    def initialize(value)
      @_key   = "Max-Forwards"
      @_value = value
    end
  end

  class ProxyAuthorization < Header
    def initialize(value)
      @_key   = "Proxy-Authorization"
      @_value = value
    end
  end

  class Range < Header
    def initialize(value)
      @_key   = "Range"
      @_value = value
    end
  end

  class Referer < Header
    def initialize(value)
      @_key   = "Referer"
      @_value = value
    end
  end

  class TE < Header
    def initialize(value)
      @_key   = "TE"
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
