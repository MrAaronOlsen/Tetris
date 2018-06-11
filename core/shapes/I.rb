class Shape
  # O O O O O
  # O O O O O
  # O X X X X
  # O O O O O
  # O O O O O

  class I < Shape
    def initialize
      super
    end

    def get_blocks
      [ Block.new(-1, 0), Block.new(0, 0), Block.new(0, 1), Block.new(0, 2) ]
    end
  end
end