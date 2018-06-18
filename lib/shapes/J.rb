class Shape
  # X O O
  # X X X
  # O O O

  class J < Shape
    def initialize(pos)
      @pos = pos
      @angle = 0
      @color = Colors.blue

      build
    end

    def shape_map
      [ V.new(-1, 1), V.new(-1, 0), V.new(0, 0), V.new(1, 0) ]
    end
  end
end