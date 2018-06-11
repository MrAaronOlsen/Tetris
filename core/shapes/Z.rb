class Shape
  # X X O
  # O X X
  # O O O

  class Z < Shape
    def initialize
      super
    end

    def get_blocks
      [ Block.new(-1, -1), Block.new(0, -1), Block.new(0, 0), Block.new(0, 1) ]
    end
  end
end