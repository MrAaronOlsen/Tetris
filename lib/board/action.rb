module Board
  class Action

    def query(action, block)
      return if action.nil?

      case action
      when Gosu::KB_UP
        block.rotate(1)
      when Gosu::KB_DOWN
        block.rotate(-1)
      when Gosu::KB_LEFT
        block.move(V.new(-1, 0))
      when Gosu::KB_RIGHT
        block.move(V.new(1, 0))
      when Gosu::KB_SPACE
        block.drop
      end
    end
  end
end