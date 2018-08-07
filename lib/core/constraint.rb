class Constraint
  attr_reader :walls, :grid

  def initialize(grid, walls = {})
    @grid = grid
    @walls = walls
  end

  def rotate_shape(direction, shape)
    return if shape.nil?

    next_state = get_next_state(shape.state, direction)
    kick_offset = Shape::Offsets.get_for(shape.type)
    next_pos = shape.pos

    Array(0..kick_offset[0].size - 1).each do |i|
      next_pos = shape.pos + (kick_offset[shape.state][i] - kick_offset[next_state][i])
      next_transform = Mat.new_transform(next_pos, next_state * 90)

      break if !colliding?(shape, next_transform)
      return if i == kick_offset[0].size - 1
    end

    shape.set(next_pos, next_state)
  end

  def move_shape(direction, shape)
    return if shape.nil?

    next_pos = shape.pos + direction
    next_trans = Mat.new_transform(next_pos, shape.get_angle)

    if !colliding?(shape, next_trans)
      shape.set(next_pos, shape.state)
      return true
    end

    false
  end

  def colliding?(shape, transform)
    shape_blocks = shape.get_block_positions(transform)

    shape_blocks.each do |pos|
      return true if colliding_with_walls(pos)
      return true if colliding_with_other_pieces(pos)
    end

    false
  end

  def colliding_with_other_pieces(pos)
    @grid.rows[pos.y].cells[pos.x].has_block?
  end

  def colliding_with_walls(pos)
    pos.x < walls[:left] || pos.x > walls[:right] || pos.y > walls[:bottom] || pos.y < walls[:top]
  end

  def get_next_state(current_state, direction)
    next_state = (current_state + direction) % 4
    next_state += 3 if next_state < 0
    next_state
  end
end