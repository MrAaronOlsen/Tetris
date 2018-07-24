class Shape
  # O O O O O
  # O O O O O
  # O X X X X
  # O O O O O
  # O O O O O

  class I < Shape
    def initialize(pos)
      @type = "I"
      @pos = pos
      @angle = 0
      @color = get_color

      build
    end

    def get_color
      Colors.light_blue
    end

    def shape_map
      [ V.new(-1, 0), V.new(0, 0), V.new(1, 0), V.new(2, 0) ]
    end
  end
end