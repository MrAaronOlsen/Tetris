class Colors
  class << self
    def red
      Color.new(255, 255, 0, 0)
    end

    def green
      Color.new(255, 0, 255, 0)
    end

    def blue
      Color.new(255, 0, 0, 255)
    end

    def light_blue
      Color.new(255, 66, 244, 229)
    end

    def yellow
      Color.new(255, 255, 255, 0)
    end

    def megenta
      Color.new(255, 255, 255, 255)
    end

    def purple
      Color.new(255, 255, 0, 255)
    end

    def white
      Color.new(255, 255, 255, 255)
    end

    def light_grey
      Color.new(255, 220, 220, 220)
    end

    def grey
      Color.new(255, 120, 120, 120)
    end

    def dark_grey
      Color.new(255, 60, 60, 60)
    end

    def black
      Color.new(255, 0, 0, 0)
    end

    def orange
      Color.new(255, 255, 128, 0)
    end
  end
end