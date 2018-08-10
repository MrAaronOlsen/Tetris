module Menu
  class Controller

    # Override
    def query(key, arbiter)
      return if key.nil?

      case key
      when Gosu::KB_UP
        arbiter.move_selection(-1)
      when Gosu::KB_DOWN
        arbiter.move_selection(1)
      when Gosu::KB_RETURN
        arbiter.trigger_action
      end
    end
  end
end