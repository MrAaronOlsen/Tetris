module Board
  class Arbiter
    attr_reader :well, :controller, :constraint

    def initialize
      @well = Well.new
      @controller = Controller.new
      @constraint = Constraint.new(@well.grid, walls)
    end

    def live_shape
      @well.live_shape
    end

    def walls
      {left: 0, right: 9, bottom: @well.height - 1, top: 0}
    end

    # Override
    def update
      return unless @well.go?

      apply_gravity

      if live_shape.nil?
        @well.spawn_shape
        $game.game_over(@well.get_score) if @constraint.colliding_with_other_pieces(live_shape.pos)
      end
    end

    # Override
    def draw(scale)
      @well.draw(scale)
    end

    # Override
    def query_key(key)
      @controller.query(key, self)
    end

    def move_shape(direction)
      @constraint.move_shape(direction, live_shape)
    end

    def rotate_shape(direction)
      @constraint.rotate_shape(direction, live_shape)
    end

    def start_freeze_timer
      if @freeze_timer.nil?
        @freeze_timer = Tick.new(0.5)
        live_shape.shade(-60)
      end
    end

    def apply_gravity
      return if @well.live_shape.nil?

      if !@constraint.move_shape(V.new(0, 1), live_shape)
        start_freeze_timer

        if @freeze_timer.go? || @hard_drop
          @well.freeze_live_shape

          @freeze_timer = nil
          @hard_drop = nil
        end
      else
        live_shape.reset_color
      end
    end

    def drop_live_shape
      while @constraint.move_shape(V.new(0, 1), live_shape)
      end

      @hard_drop = true
      @well.reset_tick
    end
  end
end