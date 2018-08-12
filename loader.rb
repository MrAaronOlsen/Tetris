require 'gosu'
require 'pry-nav'
require 'colorize'

Dir["./lib/*.rb"].each { |file| require file }
Dir["./lib/shapes/*.rb"].each { |file| require file }
Dir["./lib/board/*.rb"].each { |file| require file }
Dir["./lib/menu/*.rb"].each { |file| require file }
Dir["./lib/render/*.rb"].each { |file| require file }
Dir["./lib/ruby/*.rb"].each { |file| require file }
Dir["./lib/utils/*.rb"].each { |file| require file }
Dir["./lib/core/*.rb"].each { |file| require file }
Dir["./lib/game/*.rb"].each { |file| require file }