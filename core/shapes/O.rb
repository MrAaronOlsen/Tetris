class Shape
  # O X X
  # O X X
  # O O O

  class O < Shape
    def initialize(pos)
      @pos = pos
      @angle = 0
      @color = Colors.yellow

      build
    end

    def shape_verts
      [ V.new(0, 0), V.new(0, 1), V.new(1, 1), V.new(1, 0) ]
    end
  end
end