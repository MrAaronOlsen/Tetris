class Scene
  attr_reader :width, :height
  attr_reader :well

  def initialize(width)
    @width = width
    @scale = Mat.new_scale(@width / 24, @width / 24)

    @well = Board::Well.new
    @arbiter = Board::Arbiter.new(@well)

    @tick = Tick.new
  end

  def update
    @arbiter.update if @tick.check(@well.speed)
  end

  def draw
    @well.draw(@scale)
  end

  def button_down(button)
    @arbiter.query(button)
  end
end