require 'gosu'
require 'pry-nav'
require 'colorize'

Dir["./lib/*.rb"].each { |file| require file }
Dir["./lib/shapes/*.rb"].each { |file| require file }
Dir["./lib/board/*.rb"].each { |file| require file }
Dir["./lib/render/*.rb"].each { |file| require file }
Dir["./lib/math/*.rb"].each { |file| require file }
Dir["./lib/core/*.rb"].each { |file| require file }