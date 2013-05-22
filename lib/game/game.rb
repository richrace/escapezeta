require 'game/menu'
require 'game/player'
require 'rooms/air_lock'
require 'rooms/science_lab'
require 'rooms/mess_hall'
require 'rooms/crew_quarters'
require 'rooms/launch_control'
require 'rooms/launch_pad'
require 'rooms/rocket'
require 'game/inventory'
require 'game/items/foot_locker'
require 'game/input_parser'
require 'game/handle_commands'

class Game
  CANNOT_MOVE = "You can't go that way!"

  attr_accessor :player, :inventory, :rooms, :current_room, :input_parser, :handle_commands

  def initialize(player_name)
    @input_parser = InputParser.new self
    @handle_commands = HandleCommands.new self
    reset(player_name)
  end

  def reset(player_name)
    @player = Player.new player_name
    @inventory = Inventory.new
    @current_room = AirLock.new
    @rooms = {@current_room.class => @current_room, 
              ScienceLab => ScienceLab.new,
              MessHall => MessHall.new,
              CrewQuarters => CrewQuarters.new,
              LaunchControl => LaunchControl.new,
              LaunchPad => LaunchPad.new,
              Rocket => Rocket.new}
  end

  def start
    Menu.start
    @current_room.print_room
    @input_parser.parse_command InputParser.get_command
  end

  def death(message = nil)
    puts "#{@player.name}, you're dead."
    puts message if message
    @handle_commands.play_again
  end

  def win
    puts "You blast off into space!\nCongratulations, #{@player.name}! You escaped Zeta Base Alpha!"
    @handle_commands.play_again
  end

end