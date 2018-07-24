class Color
  attr_reader :a, :r, :g, :b
  attr_reader :color

  def initialize(a, r, g, b)
    @a, @r, @g, @b = a, r, g, b
  end

  def fade(n)
    @a += n
  end

  def get_shade(amount)
    Color.new(@a, (@r + amount).clamp(0, 255), (@g + amount).clamp(0, 255), (@b + amount).clamp(0, 255))
  end

  def shade(amount)
    @r = (@r + amount).clamp(0, 255)
    @g = (@g + amount).clamp(0, 255)
    @b = (@b + amount).clamp(0, 255)
  end

  def get
    Gosu::Color.new(@a, @r, @g, @b)
  end
end