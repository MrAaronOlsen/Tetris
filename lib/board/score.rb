module Board
  class Score
    attr_reader :score, :lines, :level

    def initialize
      @score, @lines, @level = 0, 0, 0

      @text = Text.new(40)
    end

    def add(lines)
      @lines += lines.size
      @score += (lines.size * 100) * lines.size
    end

    def level_up?
      @lines - (@level * 10) >= 10
    end

    def level_up
      @level += 1
    end

    def draw(scale)
      @text.write("Score: #{@score}", scale.convert(V.new(15.5, 10.5)), Colors.red.get)
      @text.write("Lines: #{@lines}", scale.convert(V.new(15.5, 12.5)), Colors.green.get)
      @text.write("Level: #{@level}", scale.convert(V.new(15.5, 14.5)), Colors.blue.get)
    end
  end
end