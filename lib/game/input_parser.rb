require 'game/menu'

class InputParser 
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def self.get_command(message = nil)
    puts message if message
    Menu.prompt
    gets.chomp
  end

  def parse_command(command)
    case command.split(" ")[0]
    when "instructions"
      Menu.instructions
    when "move"
      parse_move_command command
    when "inventory"
      @game.inventory.print_contents
    when "look"
      @game.current_room.print_room
    when "name"
      @game.player.print_name
    when "take"
      @game.handle_commands.handle_take
    when "drop"
      @game.handle_commands.handle_drop
    when "wear"
      @game.handle_commands.handle_wear
    when "use"
      @game.handle_commands.handle_use
    else
      puts "I don't know what you've asked me to do."
    end
    parse_command InputParser.get_command
  end

  def parse_move_command(command)
    case command
    when "move up" 
      @game.handle_commands.handle_room_move @game.current_room.move_up    
    when "move down"
      @game.handle_commands.handle_room_move @game.current_room.move_down
    when "move right" 
      @game.handle_commands.handle_room_move @game.current_room.move_right
    when "move left" 
      @game.handle_commands.handle_room_move @game.current_room.move_left
    end
  end

end