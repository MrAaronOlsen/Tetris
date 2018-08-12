module Menu
  class Contents
    attr_reader :selection

    def initialize
      @normal_text = Text.new(40)
      @selected_text = Text.new(50)

      @selection = 0
      @constraint = Constraint.new(nil, nil)

      @IO = Tetris::IO.new
      @show_scores = false
      build_selection_shapes
    end

    def move(direction)
      @selection = (@selection + direction).clamp(0, 2)
    end

    def draw(scale)
      if @show_scores
        draw_scores(@normal_text, scale)
      else
        contents_text[@selection].call(@selected_text, scale)
        @selection_shapes[@selection].draw(Mat.new_identity, scale)

        contents_text.each_with_index do |text, i|
          text.call(@normal_text, scale) if i != @selection
        end
      end
    end

    def rotate_selected_shape
      @constraint.rotate_shape(1, @selection_shapes[@selection])
    end

    def build_selection_shapes
      @selection_shapes = [
        Shape::S.new(V.new(7.5, 10.25)),
        Shape::J.new(V.new(7.5, 12.25)),
        Shape::Z.new(V.new(7.5, 14.25)) ]
    end

    def contents_text
      [ lambda { |text, scale| text.write("Play", scale.convert(V.new(10, 9.5)), Colors.green.get) },
        lambda { |text, scale| text.write("Score Board #{@score}", scale.convert(V.new(10, 11.5)), Colors.blue.get) },
        lambda { |text, scale| text.write("Quit #{@score}", scale.convert(V.new(10, 13.5)), Colors.red.get) } ]
    end

    def show_scores
      @show_scores = true
    end

    def show_menu
      @show_scores = false
    end

    def game_over(score)
      @IO.add_score(score)
      show_scores
    end

    def draw_scores(text, scale)
      saved_scores = @IO.load_scores

      text.write("Score", scale.convert(V.new(6.5, (4))), Colors.purple.get)
      text.write("Lines", scale.convert(V.new(10.5, (4))), Colors.purple.get)
      text.write("Level", scale.convert(V.new(14.5, (4))), Colors.purple.get)

      saved_scores.sort { |a, b| b.score <=> a.score }.each_with_index do |score, i|
        text.write(score.score, scale.convert(V.new(6.5, (i + 6))), Colors.orange.get)
        text.write(score.lines, scale.convert(V.new(10.5, (i + 6))), Colors.orange.get)
        text.write(score.level, scale.convert(V.new(14.5, (i + 6))), Colors.orange.get)
      end
    end
  end
end