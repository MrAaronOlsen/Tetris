require 'spec_helper'

RSpec.describe Board::Base do

  describe '#build_base' do

    it "can build the base" do
      o = Shape::O.new
      i = Shape::I.new
      s = Shape::S.new
      z = Shape::Z.new
      l = Shape::L.new
      j = Shape::J.new
      t = Shape::T.new

      
    end

    xit "is to right of" do
      block = Block.new.freeze(V.new(2, 3))

      above = Block.new.freeze(V.new(2, 4))
      right_of = Block.new.freeze(V.new(3, 3))
      below = Block.new.freeze(V.new(2, 2))
    end

    def test_base
      [
        Block.new.freeze(V.new(2, 2)), Block.new.freeze(V.new(2, 1)), Block.new.freeze(V.new(3, 1)), Block.new.freeze(V.new(4, 1)),
        Block.new.freeze(V.new(5, 1)), Block.new.freeze(V.new(6, 1)), Block.new.freeze(V.new(6, 2)), Block.new.freeze(V.new(6, 3)),
        Block.new.freeze(V.new(7, 3)), Block.new.freeze(V.new(8, 3)), Block.new.freeze(V.new(9, 3)), Block.new.freeze(V.new(9, 4)),
        Block.new.freeze(V.new(8, 5)), Block.new.freeze(V.new(9, 5)), Block.new.freeze(V.new(10, 5)), Block.new.freeze(V.new(11, 5))
      ]
    end

    def new_shape
      [
        Block.new.freeze(V.new(1, 3)), Block.new.freeze(V.new(2, 3)), Block.new.freeze(V.new(3, 3)), Block.new.freeze(V.new(4, 3))
      ]
    end
  end
end