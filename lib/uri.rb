class URI

  @_path = nil

  def initialize(path = "*")
    @_path = path
  end

  def to_s
    "#{@_path}"
  end

end
