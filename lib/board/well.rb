module Board
  class Well
    attr_reader :width, :height
    attr_reader :grid, :offset
    attr_reader :live_shape

    def initialize
      @width, @height = 10, 16
      @offset = Mat.new_translate(V.new(5, 4))
      @grid = Grid.new(@width, @height)
      @shaper = Shaper.new
    end

    def spawn_shape
      @live_shape = @shaper.get_next
    end

    def clear
      @grid.clear
      @live_shape = nil
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
      rows_to_drop = 0
      last_row = nil

      @grid.rows.reverse.each do |row|
        if row.complete?
          row.clear

          rows_to_drop += 1
          last_row = row
        end
      end

      return if last_row.nil?
      adjust_blocks_above(last_row.number, rows_to_drop)
    end

    def adjust_blocks_above(line, rows_to_drop)
      @grid.rows.reverse.each do |row|
        next if row.number >= line

        row.cells.each do |cell|
          row_to_drop_into = @grid.rows[row.number + rows_to_drop]
          row_to_drop_into.cells[cell.x].add_block(cell.block)
          cell.clear_block
        end
      end
    end

    def draw(scale)
      @grid.draw(@offset, scale)
      @shaper.draw(scale)
      @live_shape.draw(@offset, scale) if @live_shape
    end
  end
end
