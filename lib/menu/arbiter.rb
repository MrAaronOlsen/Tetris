module Menu
  class Arbiter
    attr_reader :frame

    def initialize
      @frame = Frame.new
    end

    def update
    end

    def draw(scale)
      @frame.draw(scale)
    end

    def query_key(key)
    end
  end
end