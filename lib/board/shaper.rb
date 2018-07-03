module Board
  class Shaper
    attr_reader :live_shape, :next_shape

    def initialize
      @offset = Mat.new_translate(V.new(15, 6))
    end

    def get_next
      @live_shape = @next_shape || random_shape
      @next_shape = random_shape
      @live_shape
    end

    def random_shape
      shapes.sample.call(V.new(4, 1))
    end

    def draw(scale)
      @next_shape.draw(@offset, scale) if @next_shape
    end

    def shapes
      [ lambda { |pos| Shape::S.new(pos) },
        lambda { |pos| Shape::Z.new(pos) },
        lambda { |pos| Shape::J.new(pos) },
        lambda { |pos| Shape::L.new(pos) },
        lambda { |pos| Shape::T.new(pos) },
        lambda { |pos| Shape::O.new(pos) },
        lambda { |pos| Shape::I.new(pos) } ]
    end
  end
end