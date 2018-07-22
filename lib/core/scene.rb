class Scene
  attr_reader :width, :height
  attr_reader :well

  def initialize(width, height)
    @width, @height = width, height
    @scale = Mat.new_scale(@width / 24, @width / 24)

    @well = Board::Well.new
    @arbiter = Board::Arbiter.new(@well)

    @tick = Tick.new(0.5)
  end

  def update
    @arbiter.update if @tick.check
  end

  def draw
    @well.draw(@scale)
  end

  def button_down(button)
    @arbiter.query(button)
  end
end