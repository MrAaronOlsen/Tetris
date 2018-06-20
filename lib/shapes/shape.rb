class Shape
  attr_reader :pos, :angle, :blocks
  attr_reader :color
  attr_reader :transform

  def build
    @blocks = build_shape
    set_transform
  end

  def build_shape
    shape_map.map do |pos|
      Block.new(pos, @color, fill: true, z: 2)
    end
  end

  def get_world_block_pos
    @blocks.map do |block|
      @transform.convert(block.pos)
    end
  end

  def set_transform
    @transform = Mat.new_transform(@pos, @angle)
  end

  def rotate(direction)
    @angle += (90 * direction)
    set_transform
  end

  def move(direction)
    @pos += (V.new(1 * direction, 0))
    set_transform

    @blocks.each do |block|
      block_pos = @transform.convert(block.pos)

      if block_pos.x < 0 || block_pos.x > 9
        @pos -= (V.new(1 * direction, 0))
        set_transform
      end
    end

    set_transform
  end

  def draw(offset, scale)
    @blocks.each { |block| block.draw(@transform.add_translate(offset), scale) }
  end
end