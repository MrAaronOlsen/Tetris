module Board
  class Arbiter
    attr_reader :well

    def initialize(well)
      @well = well
    end

    def live_shape
      @well.live_shape
    end

    def query(action)
      return if action.nil?

      case action
      when Gosu::KB_UP
        rotate_live_shape(1)
      when Gosu::KB_DOWN
        rotate_live_shape(-1)
      when Gosu::KB_LEFT
        move_live_shape(V.new(-1, 0))
      when Gosu::KB_RIGHT
        move_live_shape(V.new(1, 0))
      when Gosu::KB_SPACE
        @well.live_shape = nil
      end
    end

    def update
      if live_shape.nil?
        @well.spawn_shape
      else
        drop_live_shape
      end
    end

    def rotate_live_shape(direction)
      return if live_shape.nil?

      next_state = get_next_state(live_shape.state, direction)
      kick_offset = Shape::Offsets.get_for(live_shape.type)
      next_pos = live_shape.pos

      Array(0..kick_offset[0].size - 1).each do |i|
        next_pos = live_shape.pos + (kick_offset[live_shape.state][i] - kick_offset[next_state][i])
        next_transform = Mat.new_transform(next_pos, next_state * 90)

        break unless colliding?(live_shape, next_transform)
      end

      live_shape.set(next_pos, next_state)
    end

    def move_live_shape(direction)
      return if live_shape.nil?
      
      next_pos = get_next_position(live_shape.pos, direction)
      next_trans = Mat.new_transform(next_pos, live_shape.get_angle)

      if !colliding?(live_shape, next_trans)
        live_shape.set(next_pos, live_shape.state)
        return true
      end

      false
    end

    def drop_live_shape
      @well.freeze if !move_live_shape(V.new(0, 1))
    end

    def colliding?(shape, transform)
      shape_blocks = shape.get_block_positions(transform)

      shape_blocks.each do |pos|
        return true if colliding_with_walls(pos)
        return true if colliding_with_other_pieces(pos)
      end

      false
    end

    def colliding_with_walls(pos)
      pos.x < 0 || pos.x > 9 || pos.y > 15
    end

    def colliding_with_other_pieces(pos)
      @well.frozen_shapes.each do |shape|
        shape_blocks = shape.get_block_positions(shape.transform)
        return true if shape_blocks.any? { |block_pos| block_pos == pos }
      end

      false
    end

    def get_next_state(current_state, direction)
      next_state = (current_state + direction) % 4
      next_state += 3 if next_state < 0
      next_state
    end

    def get_next_position(current_position, direction)
      current_position + direction
    end
  end
end