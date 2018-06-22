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

  def set(pos, state)
    @pos = pos
    @state = state

    set_transform
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

  def draw(offset, scale)
    @blocks.each { |block| block.draw(@transform.add_translate(offset), scale) }
  end

  class << self
    def random
      [ lambda { |pos| Shape::S.new(pos) },
        lambda { |pos| Shape::Z.new(pos) },
        lambda { |pos| Shape::J.new(pos) },
        lambda { |pos| Shape::L.new(pos) },
        lambda { |pos| Shape::T.new(pos) },
        lambda { |pos| Shape::O.new(pos) },
        lambda { |pos| Shape::I.new(pos) } ].sample
    end

    # def random
    #   [ lambda { |pos| Shape::S.new(pos) }, lambda { |pos| Shape::Z.new(pos) }].sample
    # end
  end
end