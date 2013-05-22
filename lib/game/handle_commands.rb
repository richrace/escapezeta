class HandleCommands 
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def play_again
    choice = InputParser.get_command "Would you like to start over? (y/n)"
    if choice == "y" || choice == "yes"
      @game.reset @game.player.name
      @game.start
    else
      exit
    end
  end

  def handle_room_move(room)
    found_room = @game.rooms[room]
    if found_room
      if found_room.class == LaunchPad
        handle_launch_pad      
      elsif found_room.class == Rocket
        handle_rocket
      end
      @game.current_room = found_room 
    else 
      puts Game::CANNOT_MOVE
    end
    @game.current_room.print_room
  end

  def handle_launch_pad
    has_suit = @game.player.wearing.select {|item| item.name.eql?("Spacesuit")}
    @game.death "You opened the Air Lock without a Spacesuit and exploded in Space!" unless has_suit.size > 0  
  end

  def handle_rocket
    if @game.inventory.find_item("Rations") && @game.rooms[LaunchControl].closed? == false
      @game.win
    elsif @game.rooms[LaunchControl].closed?
      @game.death "You blasted off straight into the Closed Launch Dome!"
    else
      @game.death "You blasted off into Space without any rations and die of starvation..."
    end
  end

  def handle_take
    take = InputParser.get_command "What will you take?"
    found_item = @game.current_room.find_and_remove_takeable_item take

    if found_item
      @game.inventory.items << found_item 
      @game.inventory.print_contents
      puts "You have taken #{found_item.name}"
    else 
      puts "I couldn't take that item."
    end
  end

  def handle_drop
    drop = InputParser.get_command "What will you drop?"
    found_item = @game.inventory.find_and_remove_item(drop)
    
    if found_item
      @game.current_room.items << found_item
      puts "Dropping #{found_item.name} in #{@game.current_room.name}"
    else
      puts "You can't drop #{drop}"
    end    
  end

  def handle_wear
    wear = InputParser.get_command "What will you wear?"
    found_item = @game.inventory.find_and_remove_wearable_item(wear)
  
    if found_item
      @game.player.wearing << found_item
      puts "Wearing #{found_item.name}"
    else
      puts "You can't wear #{wear}"
    end 
  end

  def handle_use
    use_inventory = InputParser.get_command "What will you use?"
    found_inventory_item = @game.inventory.find_usable_item(use_inventory)

    if found_inventory_item
      use_item_on = InputParser.get_command "What will use #{found_inventory_item.name} on?"

      found_room_item = @game.current_room.find_usable_item use_item_on

      if found_room_item
        puts "Using #{found_inventory_item.name} on #{found_room_item.name}..."

        if found_inventory_item.name.eql?("Plasma Cutter") && found_room_item.class.eql?(FootLocker)
          puts "Zapp! Opening the Foot Locker!"
          (@game.current_room.items << found_room_item.items).flatten!
          @game.current_room.items.delete found_room_item
          @game.current_room.print_room
        elsif found_inventory_item.name.eql?("Keycard") && found_room_item.name.eql?("Launch Dome Control")
          puts "BUUUUUZZZZZZ! The Launch Dome is opening!"
          @game.current_room.closed = false
        else
          puts "It had no effect..."
        end
      else 
        puts "Couldn't use #{use_item_on}"
      end     
    else
      puts "Couldn't use #{use_inventory}"
    end
  end

end