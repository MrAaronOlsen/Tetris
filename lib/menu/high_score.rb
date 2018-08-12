module Menu
  class HighScore
    attr_accessor :game_over, :new_high_score

    def initialize
      @game_over = @new_high_score = false

      @IO = Tetris::IO.new
    end

    def draw(text, scale)
      saved_scores = @IO.load_scores

      text.write("High Scores", scale.convert(V.new(9, 3)), Colors.blue.get)

      text.write("Score", scale.convert(V.new(6.5, 5)), Colors.purple.get)
      text.write("Lines", scale.convert(V.new(10.5, 5)), Colors.purple.get)
      text.write("Level", scale.convert(V.new(14.5, 5)), Colors.purple.get)

      saved_scores.sort { |a, b| b.score <=> a.score }.each_with_index do |score, i|
        text.write(score.score, scale.convert(V.new(6.5, (i + 7))), Colors.orange.get)
        text.write(score.lines, scale.convert(V.new(10.5, (i + 7))), Colors.orange.get)
        text.write(score.level, scale.convert(V.new(14.5, (i + 7))), Colors.orange.get)
      end

      text.write("Game Over", scale.convert(V.new(9, 20)), Colors.red.get) if @game_over
      text.write("New High Score", scale.convert(V.new(8, 18)), Colors.yellow.get) if @new_high_score
    end

    def add_score(score)
      @IO.add_score(score)
    end

    def new_high(score)
      saved_scores = @IO.load_scores

      saved_scores.each do |saved_score|
        next if saved_score.score.nil?
        return false if saved_score.score.to_i >= score.score
      end

      true
    end
  end
end