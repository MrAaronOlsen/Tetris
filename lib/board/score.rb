module Board
  class Score
    attr_reader :score, :lines, :level


    def initialize
      @score, @lines, @level = 0, 0, 0
      @score_offset = Mat.new_translate(V.new(15.5, 10.5))
      @lines_offset = Mat.new_translate(V.new(15.5, 12.5))
      @level_offset = Mat.new_translate(V.new(15.5, 14.5))

      @font = Gosu::Font.new(40)
    end

    def add(lines)
      @lines += lines.size
      @score += (lines.size * 100) * lines.size

      @level += 1 if @lines - (@level * 10) >= 10
    end

    def draw(scale)
      score_loc = scale.convert(@score_offset.convert(V.new))
      lines_loc = scale.convert(@lines_offset.convert(V.new))
      level_loc = scale.convert(@level_offset.convert(V.new))

      @font.draw("Score: #{@score}", score_loc.x, score_loc.y, 1, 1, 1, color = Colors.red.get)
      @font.draw("Lines: #{@lines}", lines_loc.x, lines_loc.y, 1, 1, 1, color = Colors.green.get)
      @font.draw("Level: #{@level}", level_loc.x, level_loc.y, 1, 1, 1, color = Colors.blue.get)
    end
  end
end