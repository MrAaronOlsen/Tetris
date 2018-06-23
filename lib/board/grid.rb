module Board
  class Grid
    attr_reader :rows

    def initialize(width, height)
      @width = width
      @height = height
      @rows = Array.new

      build_grid
    end

    def add_shape(shape)
      shape.freeze_blocks(shape.transform)

      shape.blocks.each do |block|
        @rows[block.y].cells[block.x].add_block(block)
      end
    end

    def build_grid
      @height.times do |r|
        @rows << Row.new(r,  @width)
      end
    end

    def draw(offset, scale)
      @rows.each { |row| row.draw(offset, scale) }
    end
  end
end