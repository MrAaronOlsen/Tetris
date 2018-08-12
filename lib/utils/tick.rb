class Tick
  attr_reader :span, :time

  def initialize(span)
    @span = span
    @time = Time.now
  end

  def set_span(span)
    @span = span
  end

  def reset
    @time = Time.now - span
  end

  def go?
    now = Time.now
    @time = now if now - @time >= span
  end
end