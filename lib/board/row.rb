module Board
  class Row
    attr_reader :number, :cells

    def initialize(number, width)
      @number = number
      @cells = Array.new
      add_cells(number, width)
    end

    def complete?
      @cells.all? { |cell| cell.has_block? }
    end

    def clear
      @cells.each { |cell| cell.clear_block }
    end

    def next_row
      @number - 1
    end

    def previous_row
      @number + 1
    end

    def add_cells(number, width)
      width.times do |i|
        @cells << Cell.new(Block.new(V.new(i, number), Colors.grey))
      end
    end

    def draw(offset, scale)
      @cells.each { |cell| cell.draw(offset, scale) }
    end
  end
end