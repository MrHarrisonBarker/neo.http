require 'socket'

class Main
  @something = 10
  @inst      = 20

  def initialize(x)
    puts('initializing main')
    @something = x
  end

  attr_reader :something
end

puts(Main.new(20).something)
puts('Hello World!')

s = Socket.open(:PACKET, :RAW)
puts s;