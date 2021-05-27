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
    if (key_value[1])[0] == " "
      key_value[1] = (key_value[1])[1..]
    end
    Header::new(key_value[0].chomp, key_value[1].chomp)
  end

end