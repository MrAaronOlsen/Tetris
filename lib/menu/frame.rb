module Menu
  class Frame

    def initialize
      @frame_offset = Mat.new_translate(V.new(2, 2))
      @height, @width = 20, 20

      @constraint = Constraint.new(nil, nil)
      @origin = Mat.new_identity

      @new_shape_tick = Tick.new(1)
      @drop_shape_tick = Tick.new(0.1)

      @falling_shapes = []
      @FallingShape = Struct.new(:get, :rot, :speed)
      build
    end

    def build
      @world_sides = [V.new, V.new(@width, 0), V.new(@width, @height), V.new(0, @height)]
    end

    def get_world_sides(origin, scale)
      @world_sides.map { |side| scale.convert(origin.convert(side)) }
    end

    def update
      if @new_shape_tick.go? && @falling_shapes.size < 8
        @falling_shapes.push(new_falling_shape)
        @new_shape_tick = Tick.new(rand(1..3))
      end

      drop_shapes if @drop_shape_tick.go?
    end

    def new_falling_shape
      new_shape = Shapes.factories.sample.call(V.new(rand(1.0..24.0), -3))
      new_shape.fill = false
      new_shape.z = -1
      new_shape.build_shape

      speed = rand(0.10..0.75)
      rotation = 30 * speed

      @FallingShape.new(new_shape, rotation, speed)
    end

    def drop_shapes
      @falling_shapes.each do |shape|

        @falling_shapes.delete(shape) if shape.get.pos.y > 28
        @constraint.move_shape(V.new(0, shape.speed), shape.get)
        @constraint.rotate_shape_free(shape.rot, shape.get)
      end
    end

    def draw(scale)
      @falling_shapes.each { |shape| shape.get.draw(@origin, scale) }
      Render.rect(get_world_sides(@frame_offset, scale), Colors.grey.get, false, 2)
    end

  end
end