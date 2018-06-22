class Tick
  attr_reader :span, :time

  def initialize(span)
    @span = span
    @time = Time.now
  end

  def check
    now = Time.now
    @time = now if now - @time >= span
  end
end