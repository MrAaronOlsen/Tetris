class Shape
  # O X O
  # X X X
  # O O O

  class T < Shape
    def initialize(pos)
      @type = "T"
      @pos = pos
      @angle = 0
      @color = Colors.purple

      build
    end

    def shape_map
      [ V.new(-1, 0), V.new(0, 0), V.new(0, 1), V.new(1, 0) ]
    end
  end
end