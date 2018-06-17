class Shape
  # X O O
  # X X X
  # O O O

  class J < Shape
    def initialize(pos, angle)
      super(pos, angle)
    end

    def get_blocks
      [ Block.new(-1, 1), Block.new(-1, 0), Block.new(0, 0), Block.new(1, 0) ]
    end
  end
end