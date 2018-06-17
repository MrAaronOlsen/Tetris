require 'gosu'
require 'pry-nav'

Dir["./core/*.rb"].each { |file| require file }
Dir["./core/shapes/*.rb"].each { |file| require file }
Dir["./core/board/*.rb"].each { |file| require file }
Dir["./render/*.rb"].each { |file| require file }

Window.new.show