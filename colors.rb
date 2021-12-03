require "colorize"
require 'colorized_string'

puts ColorizedString.colors                       

puts "Hello".colorize(:red).on_blue
