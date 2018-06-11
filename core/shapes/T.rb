class Shape
  # O X O
  # X X X
  # O O O

  class T < Shape
    def initialize
      super
    end

    def get_blocks
      [ Block.new(-1, 0), Block.new(0, 0), Block.new(0, 1), Block.new(1, 0) ]
    end
  end
end