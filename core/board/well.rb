module Board
  class Well
    attr_reader :width, :height
    attr_reader :matrix, :offset

    def initialize
      @width, @height = 10, 16
      @offset = Mat.new_translate(V.new(5, 4))
      build_matrix
    end

    def build_matrix
      @matrix = []
      row, col = 0, 0

      (@width * @height).times do |i|
        if i > 0 && i.modulo(@width).zero?
          row += 1
          col += @width
        end

        @matrix << Block.new do |block|
          block.pos = V.new(i - col, row)
          block.color = Colors.grey
          block.fill = false
          block.z = 1
        end
      end
    end

    def draw(scale)
      @matrix.each { |grid| grid.draw(@offset, scale) }
    end

  end
end
