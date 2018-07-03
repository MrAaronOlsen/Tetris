module Board
  class Cell
    attr_reader :grid, :block

    def initialize(block)
      @grid = block
    end

    def x
      @grid.pos.x
    end

    def y
      @grid.pos.y
    end

    def clear_grid
      @grid.clear
    end

    def add_block(block)
      return if block.nil?

      block.pos = V.new(x, y)
      block.build

      @block = block
    end

    def clear_block
      @block = nil
    end

    def has_block?
      @block.exists?
    end

    def draw(origin, scale)
      @grid.draw(origin, scale) if @grid
      @block.draw(origin, scale) if @block
    end
  end
end