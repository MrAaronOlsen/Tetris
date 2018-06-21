class Arbiter

  class << self

    def check_rotation(shape, next_state)
      next_angle = next_state * 90
      kick_offset = get_kick_offset_for(shape.type)

      puts "\n"
      puts "******* Start *******"
      puts "Current Position: #{shape.pos}"
      puts "Current State: #{shape.state}"
      puts "Next State: #{next_state}"

      Array(0..kick_offset[0].size - 1).each do |i|
        puts "Kick Offset This State: #{kick_offset[shape.state][i]}"
        puts "Kick Offset Next State: #{kick_offset[next_state][i]}"

        kick = kick_offset[shape.state][i] - kick_offset[next_state][i]
        puts "Kick: #{kick}"

        next_pos = shape.pos + kick
        puts "Next Position: #{next_pos}"
        next_transform = Mat.new_transform(next_pos, next_angle)

        if not_colliding(shape, next_transform)
          shape.pos = next_pos
          shape.state = next_state
          shape.set_transform
          break
        end
      end
    end

    def check_position(shape, next_pos)
      next_trans = Mat.new_transform(next_pos, shape.get_angle)

      if not_colliding(shape, next_trans)
        shape.pos = next_pos
        shape.set_transform
      end
    end

    def not_colliding(shape, next_trans)
      shape.get_block_positions(next_trans).each do |pos|
        return false if pos.x < 0 || pos.x > 9
      end

      true
    end

    def kick_offset_JLSZT
      [ [ V.new( 0, 0), V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0) ],
        [ V.new( 0, 0),	V.new( 1, 0),	V.new( 1,-1),	V.new( 0, 2),	V.new( 1, 2) ],
        [ V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0) ],
        [	V.new( 0, 0), V.new(-1, 0),	V.new(-1,-1),	V.new( 0, 2),	V.new(-1, 2) ] ]
    end

    def kick_offset_I
      [ [ V.new( 0, 0),	V.new(-1, 0),	V.new( 2, 0),	V.new(-1, 0),	V.new( 2, 0) ],
        [ V.new(-1, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 1),	V.new( 0,-2) ],
        [ V.new(-1, 1),	V.new( 1, 1),	V.new(-2, 1),	V.new( 1, 0),	V.new(-2, 0) ],
        [ V.new( 0, 1),	V.new( 0, 1),	V.new( 0, 1),	V.new( 0,-1),	V.new( 0, 2) ] ]
    end

    def kick_offset_O
      [ [ V.new( 0, 0) ],
        [ V.new( 0,-1) ],
        [ V.new(-1,-1) ],
        [ V.new(-1, 0) ] ]
    end

    def get_kick_offset_for(type)
      case type
      when "I"
        kick_offset_I
      when "O"
        kick_offset_O
      when "J", "L", "S", "Z", "T"
        kick_offset_JLSZT
      end
    end
  end
end