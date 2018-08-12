module Menu
  class Contents
    attr_reader :selection

    def initialize
      @normal_text = Text.new(40)
      @selected_text = Text.new(50)

      @selection = 0
      @constraint = Constraint.new(nil, nil)

      @show_scores = false
      @high_score = HighScore.new
      build_selection_shapes
    end

    def move(direction)
      @selection = (@selection + direction).clamp(0, 2)
    end

    def draw(scale)
      if @show_scores
        @high_score.draw(@normal_text, scale)
      else
        draw_contents(scale)
      end
    end

    def draw_contents(scale)
      contents_text[@selection].call(@selected_text, scale)
      @selection_shapes[@selection].draw(Mat.new_identity, scale)

      contents_text.each_with_index do |text, i|
        text.call(@normal_text, scale) if i != @selection
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
        lambda { |text, scale| text.write("Score Board", scale.convert(V.new(10, 11.5)), Colors.blue.get) },
        lambda { |text, scale| text.write("Quit", scale.convert(V.new(10, 13.5)), Colors.red.get) } ]
    end

    def show_scores(reset)
      if reset
        @high_score.new_high_score = false
        @high_score.game_over = false
      end

      @show_scores = true
    end

    def show_menu
      @show_scores = false
    end

    def game_over(score)
      @high_score.game_over = true
      @high_score.new_high_score = true if @high_score.new_high(score)
      @high_score.add_score(score)
      show_scores(false)
    end
  end
end