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
              LaunchPad => LaunchPad.new,
              Rocket => Rocket.new}
  end

  def start
    Menu.start
    @current_room.print_room
    preform_action get_command
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
      # death if found_room.class == LaunchPad && spacesuit is not on.
      # process if found_room.class == Rocket.
      @current_room = found_room 
    else 
      puts CANNOT_MOVE
    end
    @current_room.print_room
  end

  def preform_action(command)
    case command.split(" ")[0]
    when "instructions"
      Menu.instructions
    when "move"
      handle_move command
    when "inventory"
      @inventory.print_contents
    when "look"
      @current_room.print_room
    when "name"
      @player.print_name
    when "take"
      handle_take
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

  def handle_take
    puts "What will you take?"
    take = gets.chomp
    @contents.each { |item| found_item = @contents.delete item if item.takeable && item.name.eql?(take) }
    if found_item
      @inventory.items << found_item 
      @inventory.print_contents
      puts "You have taken #{found_item}"
    end
  end

end