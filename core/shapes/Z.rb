class Shape
  # X X O
  # O X X
  # O O O

  class Z < Shape
    def initialize(pos)
      @pos = pos
      @angle = 0
      @color = Colors.red

      build
    end

    def shape_verts
      [ V.new(-1, -1), V.new(0, -1), V.new(0, 0), V.new(0, 1) ]
    end
  end
end