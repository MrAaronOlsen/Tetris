class Shape
  # O O X
  # X X X
  # O O O

  class L < Shape
    def initialize(pos)
      @type = "L"
      @pos = pos
      @angle = 0
      @color = Colors.orange

      build
    end

    def shape_map
      [ V.new(-1, 0), V.new(0, 0), V.new(1, 0), V.new(1, 1) ]
    end
  end
end