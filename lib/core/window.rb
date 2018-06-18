class Window < Gosu::Window

	def initialize
    $window_width = 1200
    $window_height = 1200

    super($window_width, $window_height, false)
    self.caption = "Tetris"

		@scene = Scene.new($window_width, $window_height)
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