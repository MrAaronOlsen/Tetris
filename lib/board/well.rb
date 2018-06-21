module Board
  class Well
    attr_reader :width, :height
    attr_reader :matrix, :offset
    attr_reader :live_shape

    def initialize
      @width, @height = 10, 16
      @offset = Mat.new_translate(V.new(5, 4))
      @matrix = Array.new(@width * @height)
      build_matrix

      @live_shape = Shape::I.new(V.new(5, 3))
    end

    def build_matrix
      row, col = 0, 0

      @matrix.size.times do |i|
        if i > 0 && i.modulo(@width).zero?
          row += 1
          col += @width
        end

        @matrix[i] = Block.new(V.new(i - col, row), Colors.grey)
      end
    end

    def draw(scale)
      @matrix.each { |grid| grid.draw(@offset, scale) }
      @live_shape.draw(@offset, scale)
    end

  end
end
