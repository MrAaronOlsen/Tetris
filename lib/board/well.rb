module Board
  class Well
    attr_reader :width, :height
    attr_reader :grid, :offset
    attr_reader :live_shape

    def initialize
      @width, @height = 10, 16
      @offset = Mat.new_translate(V.new(5, 4))
      @grid = Grid.new(@width, @height)
    end

    def spawn_shape
      @live_shape = Shape.random.call(V.new(4, 1))
    end

    def freeze_live_shape
      @grid.add_shape(@live_shape)
      check_for_complete_rows

      @live_shape = nil
    end

    def has_block_at(pos)
      @grid.rows[pos.y].cells[pos.x].has_block?
    end

    def check_for_complete_rows
      @grid.rows.each do |row|
        if row.complete?
          row.destroy
          adjust_blocks_above(row.number)
        end
      end
    end

    def adjust_blocks_above(line)
      @grid.rows.each do |row|
        next if row.number > line

        row.cells.each do |cell|
          previous_row = @grid.rows[row.previous_row]
          return if previous_row.nil?

          previous_row.cells[cell.x].add_block(cell.block)
          cell.destroy_block
        end
      end
    end

    def draw(scale)
      @grid.draw(@offset, scale)
      @live_shape.draw(@offset, scale) if @live_shape
    end
  end
end
