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

class Game
  CANNOT_MOVE = "You can't go that way!"

  attr_accessor :player, :inventory, :rooms, :current_room

  def initialize(player_name)
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

  def death
    puts "#{@player.name}, you're dead."
    play_again
  end

  def win
    puts "You blast off into space!\nCongratulations, #{@player.name}! You escaped Zeta Base Alpha!"
    play_again
  end

  def play_again
    puts "Would you like to start over? (y/n)"
    Menu.prompt
    choice = gets.chomp
    if choice == "y" || choice == "yes"
      reset @player.name
      start
    else
      exit
    end
  end

  def handle_room_move(room)
    found_room = @rooms[room]
    if found_room
      if found_room.class == LaunchPad
        has_suit = @player.wearing.select {|item| item.name.eql?("Spacesuit")}
        death unless has_suit.size > 0
      elsif found_room.class == Rocket
        has_rations = @inventory.items.select {|item| item.name.eql?("Rations")}
        if has_rations.size > 0
          win
        else
          death
        end
      end
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
      handle_drop
    when "wear"
      handle_wear
    when "use"
      handle_use
    else
      puts "I don't know what you've asked me to do."
    end
    preform_action get_command
  end

  def handle_take
    puts "What will you take?"
    Menu.prompt
    take = gets.chomp

    found_items = @current_room.contents.select {|item| item.takeable? && item.name.downcase.eql?(take.downcase)}

    if found_items.size == 1
      found_item = @current_room.contents.delete found_items[0]
      @inventory.items << found_item 
      @inventory.print_contents
      puts "You have taken #{found_item.name}"
    else 
      puts "I couldn't take that item."
    end
  end

  def handle_drop
    puts "What will you drop?"
    Menu.prompt
    drop = gets.chomp

    found_items = @inventory.items.select {|item| item.name.downcase.eql? drop.downcase}
    
    if found_items.size == 1
      found_item = @inventory.items.delete found_items[0] 
      @current_room.contents << found_item
      puts "Dropping #{found_item.name} in #{@current_room.name}"
    else
      puts "You can't drop #{drop}"
    end    
  end

  def handle_wear
    puts "What will you wear?"
    Menu.prompt
    wear = gets.chomp

    found_items = @inventory.items.select {|item| item.wearable? && item.name.downcase.eql?(wear.downcase)}
  
    if found_items.size == 1
      found_item = @inventory.items.delete found_items[0]
      @player.wearing << found_item
      puts "Wearing #{found_item.name}"
    else
      puts "You can't wear #{wear}"
    end 
  end

  def handle_use
    puts "What will you use?"
    Menu.prompt
    use_inventory = gets.chomp

    found_inventory = @inventory.items.select {|item| item.usable? && item.name.downcase.eql?(use_inventory.downcase)}

    if found_inventory.size > 0
      found_inventory_item = found_inventory[0]
      puts "What will use #{found_inventory_item.name} on?"
      Menu.prompt
      use_item_on = gets.chomp

      found_current = @current_room.contents.select {|item| item.usable? && item.name.downcase.eql?(use_item_on.downcase)}

      if found_current.size > 0 
        found_room_item = found_current[0]
        puts "Using #{found_inventory_item.name} on #{found_room_item.name}..."

        if found_inventory_item.name.eql?("Plasma Cutter") && found_room_item.class.eql?(FootLocker)
          puts "Zapp! Opening the Foot Locker!"
          @current_room.contents << found_room_item.contents
          @current_room.contents.flatten!
          @current_room.contents.delete found_room_item
          @current_room.print_room
        elsif found_inventory_item.name.eql?("Keycard") && found_room_item.name.eql?("Launch Dome Control")
          puts "BUUUUUZZZZZZ! The Launch Dome is opening!"
          @current_room.closed = false
        end
      else 
        puts "Couldn't use #{use_item_on}"
      end     
    else
      puts "Couldn't use #{use_inventory}"
    end
  end

end