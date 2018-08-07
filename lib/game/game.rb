class Game < Gosu::Window

	def initialize
    $width = 800
    $height = 800

    super($width, $height, false)
    self.caption = "Tetris"

    @scale = Mat.new_scale($width / 24, $width / 24)
    # @board = Board::Arbiter.new
		@menu = Menu::Arbiter.new
 	end

	def update
		@menu.update
	end

	def draw
		@menu.draw(@scale)
	end

	def button_down(key)
		@menu.query_key(key)

		close if key == Gosu::KbEscape
	end
end