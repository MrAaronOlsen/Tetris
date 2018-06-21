require 'spec_helper.rb'

RSpec.describe Board::Well do

  before do
    @state = 0
  end

  it "can build the matrix" do
    well = Board::Well.new
  end

  it "can rotate a shape" do
    shape = Shape::T.new(V.new(0, 5))
  end

  it "can find position" do
    binding.pry
  end

  def get_new_state(direction)
    @state = (@state + direction) % 4
    @state += 3 if @state < 0
  end

end