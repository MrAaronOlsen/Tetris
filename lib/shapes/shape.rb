class Shape
  attr_reader :pos, :angle, :blocks
  attr_reader :color
  attr_reader :transform

  def build
    @blocks = build_shape
    set_transform
  end

  def build_shape
    shape_verts.map do |shape|
      Block.new do |block|
        block.pos = shape
        block.color = @color
        block.fill = true
        block.z = 3
      end
    end
  end

  def rotate(direction)
    @angle += (90 * direction)
    set_transform
  end

  def set_transform
    @transform = Mat.new_transform(@pos, @angle)
  end

  def draw(offset, scale)
    @blocks.each { |block| block.draw(@transform.add_translate(offset), scale) }
  end
end