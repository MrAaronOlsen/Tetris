class Game < Gosu::Window

	def initialize
    $width = 800
    $height = 800
		$game = self

    super($width, $height, false)
    self.caption = "Tetris"

    @scale = Mat.new_scale($width / 24, $width / 24)
		@current = @menu = Menu::Scene.new(self)
 	end

	def new_game
		@current = Board::Scene.new(self)
	end

	def go_to_menu
		@current = @menu
	end

	def game_over(score)
		@menu.game_over(score)
		go_to_menu
	end

	def update
		@current.update
	end

	def draw
		@current.draw(@scale)
	end

	def button_down(key)
		@current.query_key(key)

		close if key == Gosu::KbEscape
	end
end