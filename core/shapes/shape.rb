class Shape
  attr_reader :pos, :angle, :blocks
  attr_reader :transform

  def initialize
    @pos, @angle = V.new, 0
    build
  end

  def build
    @blocks = get_blocks
    set_transform
  end

  def rotate(direction)
    @angle += (90 * direction)
    set_transform
  end

  def set_transform
    @transform = Mat.new_transform(@pos, @angle)
  end

  def blocks
    @blocks.map { |block| @transform.convert(block.offset).round }
  end
end