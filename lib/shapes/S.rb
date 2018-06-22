class Shape
  # O X X
  # X X O
  # O O O

  class S < Shape
    def initialize(pos)
      @type = "S"
      @pos = pos
      @angle = 0
      @color = Colors.green

      build
    end

    def shape_map
      [ V.new(-1, 0), V.new(0, 0), V.new(0, -1), V.new(1, -1) ]
    end
  end
end