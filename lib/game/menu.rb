class Menu

  def self.prompt
    print '---> '
  end

  def self.instructions 
    puts
    puts "-----Instructions-----"
    puts "To perform the action, type the words that follow it."
    puts "MOVE: 'up', 'down', 'left', 'right'"
    puts "INVENTORY: 'inventory'"
    puts "TAKE: 'take', then at the next prompt, type the item name"
    puts "DROP: 'drop', then at the next prompt, type the item name"
    puts "WEAR: 'wear', then at the next prompt, type the item name"
    puts "USE: 'use', then the item name, then the item on which you\nwant to use it."
    puts "LOOK: 'look'"
    puts
  end

  def self.start
    puts "Here we go!"
    puts "-"
    puts "--"
    puts "---"
    puts "----"
    puts "-----"
    puts "------"
    puts "-------"
    puts "--------"
    puts "---------"
    puts "----------"
    puts "You slowly regain consciousness. Looking around you see..."
  end

end