module Menu
  class Frame

    def initialize
      @frame_offset = Mat.new_translate(V.new(2, 2))
      @height, @width = 20, 20

      build
    end

    def build
      @world_sides = [V.new, V.new(@width, 0), V.new(@width, @height), V.new(0, @height)]
    end

    def get_world_sides(origin, scale)
      @world_sides.map { |side| scale.convert(origin.convert(side)) }
    end

    def draw(scale)
      Render.rect(get_world_sides(@frame_offset, scale), Colors.grey.get, false, 1)
    end
  end
end