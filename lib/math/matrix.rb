class Matrix
  attr_reader :a, :c, :tx
  attr_reader :b, :d, :ty

  def initialize(a, c, tx, b, d, ty)
    @a, @c, @tx = a, c, tx
    @b, @d, @ty = b, d, ty
  end

  class << self
    def new_identity
      Mat.new(1.0, 0.0, 0.0, 0.0, 1.0, 0.0)
    end

    def new_scale(x, y)
      Mat.new(x.to_f, 0.0, 0.0, 0.0, y.to_f, 0.0)
    end

    def new_translate(vect)
      Mat.new(1.0, 0.0, vect.x, 0.0, 1.0, vect.y)
    end

    def new_transform(vect, angle)
      rot = V.from_angle(angle).rounded;
      Mat.new(rot.x, -rot.y, vect.x, rot.y, rot.x, vect.y)
    end
  end

  def convert(vert)
    V.new(@a*vert.x + @c*vert.y + @tx, @b*vert.x + @d*vert.y + @ty)
  end

  def add_translate(translate)
    Mat.new(@a, @c, @tx + translate.tx, @b, @d, @ty + translate.ty)
  end
end

Mat = Matrix