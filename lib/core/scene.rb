class Scene
  attr_reader :width, :height
  attr_reader :well

  def initialize(width, height)
    @width, @height = width, height
    @scale = Mat.new_scale(@width / 24, @width / 24)
    @well = Board::Well.new

    @shapes = [
      Shape::J.new(V.new(2, 1)),
      Shape::L.new(V.new(6, 1)),
      Shape::S.new(V.new(2, 5)),
      Shape::Z.new(V.new(6, 5)),
      Shape::T.new(V.new(2, 10)),
      Shape::I.new(V.new(6, 10)),
      Shape::O.new(V.new(2, 14))
    ]

    @tick = Tick.new
  end

  def update
    @shapes.each { |shape| shape.rotate(1) } if @tick.check
  end

  def draw
    @well.draw(@scale)
    @shapes.each { |shape| shape.draw(@well.offset, @scale) }
  end
end