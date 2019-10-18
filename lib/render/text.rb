class Text

  def initialize(size)
    @writer = Gosu::Font.new(size)
  end

  def write(text, loc, color)
    @writer.draw_text(text, loc.x, loc.y, 1, 1, 1, color)
  end
end