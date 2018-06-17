class Scene
  attr_reader :width, :height
  attr_reader :well

  def initialize(width, height)
    @width, @height = width, height
    @scale = Mat.new_scale(@width / 24, @width / 24)
    @well = Board::Well.new
  end

  def update
  end

  def draw
    @well.draw(@scale)
  end
end