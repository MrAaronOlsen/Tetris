class Shape
  # O O O O O
  # O O O O O
  # O X X X X
  # O O O O O
  # O O O O O

  class I < Shape
    def initialize(pos, angle)
      super(pos, angle)
    end

    def get_blocks
      [ Block.new(-1, 0), Block.new(0, 0), Block.new(1, 0), Block.new(2, 0) ]
    end
  end
end