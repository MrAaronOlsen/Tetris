class Scene
  attr_reader :width, :height
  attr_reader :well

  def initialize(width, height)
    @width, @height = width, height
    @scale = Mat.new_scale(@width / 24, @width / 24)

    @well = Board::Well.new
    @action = Board::Action.new

    @tick = Tick.new
  end

  def update
  end

  def draw
    @well.draw(@scale)
  end

  def button_down(button)
    @action.query(button, @well.live_shape)
  end
end