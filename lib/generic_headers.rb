module GenericHeaders
  class Date < Header
    def initialize(value = Time.now.strftime("%a, %d %b %Y %H:%M:%S %z"))
      @_key   = "Date"
      @_value = value
    end
  end

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

  class Pragma < Header
    def initialize(value = "no-cache")
      @_key   = "Pragma"
      @_value = value
    end
  end

  class Trailer < Header
    def initialize(value)
      @_key   = "Trailer"
      @_value = value
    end
  end

  class TransferEncoding < Header
    def initialize(value = "chunked")
      @_key   = "Transfer-Encoding"
      @_value = value
    end
  end

  class Upgrade < Header
    def initialize(value)
      @_key   = "Upgrade"
      @_value = value
    end
  end

  class Via < Header
    def initialize(value = "HTTP/1.1 localhost")
      @_key   = "Via"
      @_value = value
    end
  end

  class Warning < Header
    def initialize(warn_code = "", warn_agent = "", warn_text = "", warn_date = Time.now.strftime("%a, %d %b %Y %H:%M:%S %z"))
      @_key   = "Warning"
      @_value = value
    end
  end
end
