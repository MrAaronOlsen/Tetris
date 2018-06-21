class Shape
  attr_reader :pos, :state, :blocks
  attr_reader :color, :type
  attr_reader :transform

  def build
    @blocks = build_shape
    @state = 0
    set_transform
  end

  def get_angle
    @state * 90
  end

  def state=(state)
    @state = state
  end

  def pos=(pos)
    @pos = pos
  end

  def set_transform
    @transform = Mat.new_transform(@pos, get_angle)
  end

  def build_shape
    shape_map.map do |pos|
      Block.new(pos, @color, fill: true, z: 2)
    end
  end

  def get_block_positions(transform)
    @blocks.map do |block|
      transform.convert(block.pos)
    end
  end

  def rotate(direction)
    Arbiter.check_rotation(self, direction)
  end

  def move(direction)
    new_pos = @pos + direction
    Arbiter.check_position(self, new_pos)
  end

  def draw(offset, scale)
    @blocks.each { |block| block.draw(@transform.add_translate(offset), scale) }
  end
end