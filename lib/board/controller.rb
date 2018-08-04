module Board
  class Controller

    def query(action, arbiter)
      return if action.nil?

      case action
      when Gosu::KB_UP
        arbiter.rotate_live_shape(1)
      when Gosu::KB_DOWN
        arbiter.rotate_live_shape(-1)
      when Gosu::KB_LEFT
        arbiter.move_live_shape(V.new(-1, 0))
      when Gosu::KB_RIGHT
        arbiter.move_live_shape(V.new(1, 0))
      when Gosu::KB_SPACE
        arbiter.drop_live_shape
      when Gosu::KB_Q
        Menu.new.show
      end
    end
  end
end