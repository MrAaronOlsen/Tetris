class Block
  attr_accessor :pos, :color, :z, :fill, :frame
  attr_reader :sides

  def initialize(pos, color, z: 1, fill: false, frame: false)
    @pos = pos
    @color = color
    @z = z
    @fill = fill
    @frame = frame
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

  def sides
    [@pos + V.new(-0.5, -0.5), @pos + V.new(0.5, -0.5), @pos + V.new(0.5, 0.5), @pos + V.new(-0.5, 0.5)]
  end

  def world(verts, pos, scale)
    verts.map { |side| scale.convert(pos.convert(side)) }
  end

  def draw(origin, scale)
    Render.rect(world(sides, origin, scale), @color.get, @fill, @z)
    Render.rect(world(sides, origin, scale), @color.get_shade(-40).get, false, @z + 1) if @frame
  end
end