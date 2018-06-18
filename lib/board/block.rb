class Block
  attr_accessor :pos, :color, :z, :fill
  attr_reader :sides

  def initialize
    yield self
    build
  end

  def build
    @world_sides = [@pos + V.new(-0.5, -0.5), @pos + V.new(0.5, -0.5), @pos + V.new(0.5, 0.5), @pos + V.new(-0.5, 0.5)]
  end

  def get_world_sides(origin, scale)
    @world_sides.map { |side| scale.convert(origin.convert(side)) }
  end

  def draw(origin, scale)
    Render.rect(get_world_sides(origin, scale), @color.get, @fill, @z)
  end
end