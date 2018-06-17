class Block
  attr_accessor :pos, :color, :z, :fill
  attr_reader :sides

  def initialize
    yield self
    build
  end

  def build
    @sides = [@pos, @pos + V.new(1, 0), @pos + V.new(1, 1), @pos + V.new(0, 1)]
  end

  def get_world_sides(origin, scale)
    @sides.map { |side| scale.convert(origin.convert(side)) }
  end

  def draw(origin, scale)
    Render.rect(get_world_sides(origin, scale), Colors.light_grey.get, @fill, @z)
  end
end