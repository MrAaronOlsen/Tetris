module Board
  class Well
    attr_reader :width, :height
    attr_reader :grid, :offset
    attr_reader :live_shape

    def initialize
      @width, @height = 10, 18
      @offset = Mat.new_translate(V.new(5, 4))

      @grid = Grid.new(@width, @height)
      @next_shape = NextShape.new
      @score = Score.new

      @tick = Tick.new(current_speed)
    end

    def go?
      @tick.go?
    end

    def current_speed
      1.0 / (@score.level + 1)
    end

    def reset_tick
      @tick.reset
    end

    def push_tick(time)
      @tick.push(time)
    end

    def spawn_shape
      @live_shape = @next_shape.get
    end

    def clear
      @grid.clear
      @live_shape = nil
    end

    def freeze_live_shape
      @live_shape.reset_color

      @grid.add_shape(@live_shape)
      check_for_complete_rows

      @live_shape = nil
    end

    def has_block_at(pos)
      @grid.rows[pos.y].cells[pos.x].has_block?
    end

    def check_for_complete_rows
      rows_to_drop = []
      last_row = nil

      @grid.rows.reverse.each do |row|
        if row.complete?
          row.clear

          rows_to_drop << row
          last_row = row
        end
      end

      return if last_row.nil?

      @score.add(rows_to_drop)

      if @score.level_up?
        @score.level_up
        @tick.set_span(current_speed)
      end

      remove_rows(rows_to_drop)
    end

    def remove_rows(rows_to_drop)
      rows_to_drop.each_with_index do |row_removed, i|

        @grid.rows.reverse.each do |row|
          next if row.number >= row_removed.number + i

          row.cells.each do |cell|
            row_to_drop_into = @grid.rows[row.number + 1]
            row_to_drop_into.cells[cell.x].add_block(cell.block)
            cell.clear_block
          end
        end
      end
    end

    def draw(scale)
      @grid.draw(@offset, scale)
      @live_shape.draw(@offset, scale) if @live_shape

      @next_shape.draw(scale)
      @score.draw(scale)
    end
  end
end
