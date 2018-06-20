require 'spec_helper.rb'

RSpec.describe Board::Well do

  it "can build the matrix" do
    well = Board::Well.new
  end

  it "can rotate a shape" do
    shape = Shape::T.new(V.new(0, 5))

    binding.pry
  end

end