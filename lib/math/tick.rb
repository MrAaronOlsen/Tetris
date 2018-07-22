class Tick
  attr_reader :span, :time

  def initialize
    @time = Time.now
  end

  def check(span)
    now = Time.now
    @time = now if now - @time >= span
  end
end