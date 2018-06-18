class Sprite
  attr_accessor :verts, :color, :trans

  def initialize
    return self if block_given?
  end
end