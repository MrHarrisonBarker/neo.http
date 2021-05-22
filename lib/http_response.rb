class HttpResponse < Message
  def initialize
    @_start_line = StatusLine::new
  end
end

class StatusLine

end