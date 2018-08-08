module Shapes
  def self.types
    ["S", "Z", "J", "L", "T", "O", "I"]
  end

  def self.factories
    [ lambda { |pos| Shape::S.new(pos) },
      lambda { |pos| Shape::Z.new(pos) },
      lambda { |pos| Shape::J.new(pos) },
      lambda { |pos| Shape::L.new(pos) },
      lambda { |pos| Shape::T.new(pos) },
      lambda { |pos| Shape::O.new(pos) },
      lambda { |pos| Shape::I.new(pos) } ]
  end

  def self.map
    { "S" => lambda { |pos| Shape::S.new(pos) },
      "Z" => lambda { |pos| Shape::Z.new(pos) },
      "J" => lambda { |pos| Shape::J.new(pos) },
      "L" => lambda { |pos| Shape::L.new(pos) },
      "T" => lambda { |pos| Shape::T.new(pos) },
      "O" => lambda { |pos| Shape::O.new(pos) },
      "I" => lambda { |pos| Shape::I.new(pos) } }
  end
end