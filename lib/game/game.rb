require './lib/game/menu'
require './lib/game/player'
require './lib/rooms/air_lock'
require './lib/rooms/science_lab'
require './lib/game/inventory'

class Game
  CANNOT_MOVE = "You can't go that way!"

  attr_accessor :player, :inventory, :rooms, :current_room

  def initialize(player_name)
    @player = Player.new player_name
    @inventory = Inventory.new
    @current_room = AirLock.new
    @rooms = {@current_room.class => @current_room, 
              ScienceLab => ScienceLab.new,
              MessHall => MessHall.new,
              CrewQuarters => CrewQuarters.new,
              LaunchControl => LaunchControl.new,
              LaunchPad => LaunchPad.new}
  end

  def start
    Menu.start
    inspect_current_room
    preform_action get_command
  end

  def inspect_current_room
    puts "The #{@current_room.name} of a space station. It contains:"
    if @current_room.contents.nil? || @current_room.contents.empty?
      puts "Nothing of interest." 
    else 
      puts @current_room.contents
    end
  end

  def get_command
    Menu.prompt
    action = gets.chomp
  end

  def handle_move(command)
    case command
    when "move up" 
      handle_room_move @current_room.move_up    
    when "move down"
      handle_room_move @current_room.move_down
    when "move right" 
      handle_room_move @current_room.move_right
    when "move left" 
      handle_room_move @current_room.move_left
    end
  end

  def handle_room_move(room)
    found_room = @rooms[room]
    if found_room
      @current_room = found_room 
    else 
      puts CANNOT_MOVE
    end
    inspect_current_room
  end

  def preform_action(command)
    case command.split(" ")[0]
    when "move"
      handle_move command
    when "inventory"
      @inventory.print_contents
    when "look"
      # to do
    when "name"
      @player.print_name
    when "take"
      # to do
    when "drop"
      # to do
    when "wear"
      # to do
    when "use"
      # to do
    else
      puts "I don't know what you've asked me to do."
    end
    preform_action get_command
  end

end