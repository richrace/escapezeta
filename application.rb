require './lib/game/menu'
require './lib/game/game'

puts "Welcome traveller, what's your name?"
Menu.prompt
name_input = gets.chomp

puts "#{name_input}, would you like to read the instructions? (y/n)"
Menu.prompt; choice = gets.chomp
Menu.instructions if choice == "y" || choice == "yes"

game = Game.new name_input
game.start