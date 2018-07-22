class Render

  class << self
    def line(points, color, z = 1)

      Gosu.draw_line(
        points[0].x, points[0].y, color,
        points[1].x, points[1].y, color, z )
    end

    def rect(points, color, fill, z = 1)
      if fill
        Gosu.draw_quad(
          points[0].x, points[0].y, color,
          points[1].x, points[1].y, color,
    			points[2].x, points[2].y, color,
    			points[3].x, points[3].y, color, z)
      else
        wire(points, color, z)
      end
    end

    def wire(points, color, z = 1)
      points.each_with_index do |point, i|
        point2 = points[(i+1) % points.count]

        line([point, point2], color, z)
      end
    end
  end
end
