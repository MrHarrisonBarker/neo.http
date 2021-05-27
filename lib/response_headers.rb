module ResponseHeaders
  class Accept_Ranges < Header
    def initialize(value = "bytes")
      @_key   = "Accept-Ranges"
      @_value = value
    end
  end

  class Age < Header
    def initialize(value = "0")
      @_key   = "Age"
      @_value = value
    end
  end

  class ETag < Header
    def initialize(value)
      @_key   = "ETag"
      @_value = value
    end
  end

  class Location < Header
    def initialize(value)
      @_key   = "Location"
      @_value = value
    end
  end

  class ProxyAuthenticate < Header
    def initialize(value)
      @_key   = "Proxy-Authenticate"
      @_value = value
    end
  end

  class RetryAfter < Header
    def initialize(value)
      @_key   = "Retry-After"
      @_value = value
    end
  end

  class Server < Header
    def initialize(value = "neo.http")
      @_key   = "Server"
      @_value = value
    end
  end

  class Vary < Header
    def initialize(value)
      @_key   = "Vary"
      @_value = value
    end
  end

  class WWWAuthenticate < Header
    def initialize(value)
      @_key   = "WWW-Authenticate"
      @_value = value
    end
  end
end
