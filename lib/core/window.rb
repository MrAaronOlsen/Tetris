class Window < Gosu::Window

	def initialize
    $window_width = 800
    $window_height = 800

    super($window_width, $window_height, false)
    self.caption = "Tetris"

		@scene = Scene.new($window_width)
 	end

	def update
		@scene.update
  end

	def draw
		@scene.draw
	end

	def button_down(id)
		@scene.button_down(id)

    close if id == Gosu::KbEscape
  end
end