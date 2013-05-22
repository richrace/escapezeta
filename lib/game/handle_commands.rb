class HandleCommands 
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def play_again
    choice = InputParser.get_command "Would you like to start over? (y/n)"
    if choice == "y" || choice == "yes"
      reset @game.player.name
      @game.start
    else
      exit
    end
  end

  def handle_room_move(room)
    found_room = @game.rooms[room]
    if found_room
      if found_room.class == LaunchPad
        has_suit = @game.player.wearing.select {|item| item.name.eql?("Spacesuit")}
        death unless has_suit.size > 0
      elsif found_room.class == Rocket
        has_rations = @game.inventory.items.select {|item| item.name.eql?("Rations")}
        if has_rations.size > 0
          @game.win
        else
          @game.death
        end
      end
      @game.current_room = found_room 
    else 
      puts Game::CANNOT_MOVE
    end
    @game.current_room.print_room
  end 

  def handle_take
    take = InputParser.get_command "What will you take?"

    found_items = @game.current_room.contents.select {|item| item.takeable? && item.name.downcase.eql?(take.downcase)}

    if found_items.size == 1
      found_item = @game.current_room.contents.delete found_items[0]
      @game.inventory.items << found_item 
      @game.inventory.print_contents
      puts "You have taken #{found_item.name}"
    else 
      puts "I couldn't take that item."
    end
  end

  def handle_drop
    drop = InputParser.get_command "What will you drop?"

    found_items = @game.inventory.items.select {|item| item.name.downcase.eql? drop.downcase}
    
    if found_items.size == 1
      found_item = @game.inventory.items.delete found_items[0] 
      @game.current_room.contents << found_item
      puts "Dropping #{found_item.name} in #{@game.current_room.name}"
    else
      puts "You can't drop #{drop}"
    end    
  end

  def handle_wear
    wear = InputParser.get_command "What will you wear?"

    found_items = @game.inventory.items.select {|item| item.wearable? && item.name.downcase.eql?(wear.downcase)}
  
    if found_items.size == 1
      found_item = @game.inventory.items.delete found_items[0]
      @game.player.wearing << found_item
      puts "Wearing #{found_item.name}"
    else
      puts "You can't wear #{wear}"
    end 
  end

  def handle_use
    use_inventory = InputParser.get_command "What will you use?"

    found_inventory = @game.inventory.items.select {|item| item.usable? && item.name.downcase.eql?(use_inventory.downcase)}

    if found_inventory.size > 0
      found_inventory_item = found_inventory[0]
      use_item_on = InputParser.get_command "What will use #{found_inventory_item.name} on?"

      found_current = @game.current_room.contents.select {|item| item.usable? && item.name.downcase.eql?(use_item_on.downcase)}

      if found_current.size > 0 
        found_room_item = found_current[0]
        puts "Using #{found_inventory_item.name} on #{found_room_item.name}..."

        if found_inventory_item.name.eql?("Plasma Cutter") && found_room_item.class.eql?(FootLocker)
          puts "Zapp! Opening the Foot Locker!"
          @game.current_room.contents << found_room_item.contents
          @game.current_room.contents.flatten!
          @game.current_room.contents.delete found_room_item
          @game.current_room.print_room
        elsif found_inventory_item.name.eql?("Keycard") && found_room_item.name.eql?("Launch Dome Control")
          puts "BUUUUUZZZZZZ! The Launch Dome is opening!"
          @game.current_room.closed = false
        end
      else 
        puts "Couldn't use #{use_item_on}"
      end     
    else
      puts "Couldn't use #{use_inventory}"
    end
  end

end