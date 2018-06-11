class Block
  attr_reader :offset, :position

  def initialize(x = 0, y = 0)
    @offset = V.new(x, y)
  end

  def freeze(position)
    @position = position
    self
  end

  def ==(block)
    block.object_id == self.object_id
  end

  def x
    @position.x
  end

  def y
    @position.y
  end

  def is_above_left_of(block)
    block.x - 1 == x && block.y + 1 == y
  end

  def is_above(block)
    block.y + 1 == y && block.x == x
  end

  def is_right_of(block)
    block.x + 1 == x && block.y == y
  end

  def is_below(block)
    block.y - 1 == y && block.x == x
  end
end