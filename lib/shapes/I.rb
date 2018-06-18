class Shape
  # O O O O O
  # O O O O O
  # O X X X X
  # O O O O O
  # O O O O O

  class I < Shape
    def initialize(pos)
      @pos = pos
      @angle = 0
      @color = Colors.light_blue

      build
    end

    def shape_map
      [ V.new(-1, 0), V.new(0, 0), V.new(1, 0), V.new(2, 0) ]
    end
  end
end