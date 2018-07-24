class Shape
  # X X O
  # O X X
  # O O O

  class Z < Shape
    def initialize(pos)
      @type = "Z"
      @pos = pos
      @angle = 0
      @color = get_color

      build
    end

    def get_color
      Colors.red
    end

    def shape_map
      [ V.new(-1, -1), V.new(0, 0), V.new(0, -1), V.new(1, 0) ]
    end
  end
end