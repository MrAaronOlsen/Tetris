class Block
  attr_accessor :pos, :color, :z, :fill
  attr_reader :sides

  def initialize(pos, color, z: 1, fill: false)
    @pos = pos
    @color = color
    @z = z
    @fill = fill

    build
  end

  def x
    @pos.x
  end

  def y
    @pos.y
  end

  def pos=(pos)
    @pos = pos
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