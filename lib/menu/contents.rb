module Menu
  class Contents

    def initialize
      @normal_text = Text.new(40)
      @selected_text = Text.new(50)

      @selection = 0
      @constraint = Constraint.new(nil, nil)
      build_selection_shapes
    end

    def move(direction)
      @selection = (@selection + direction).clamp(0, 2)
    end

    def draw(scale)
      selected_text[@selection].call(scale)
      @selection_shapes[@selection].draw(Mat.new_identity, scale)

      normal_text.each_with_index do |text, i|
        text.call(scale) if i != @selection
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

    def normal_text
      [ lambda { |scale| @normal_text.write("Play", scale.convert(V.new(10, 9.5)), Colors.green.get) },
        lambda { |scale| @normal_text.write("Score Board #{@score}", scale.convert(V.new(10, 11.5)), Colors.blue.get) },
        lambda { |scale| @normal_text.write("Quit #{@score}", scale.convert(V.new(10, 13.5)), Colors.red.get) } ]
    end

    def selected_text
      [ lambda { |scale| @selected_text.write("Play", scale.convert(V.new(10, 9.5)), Colors.green.get) },
        lambda { |scale| @selected_text.write("Score Board #{@score}", scale.convert(V.new(10, 11.5)), Colors.blue.get) },
        lambda { |scale| @selected_text.write("Quit #{@score}", scale.convert(V.new(10, 13.5)), Colors.red.get) } ]
    end
  end
end