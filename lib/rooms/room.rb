require 'game/menu'

class Room
  attr_accessor :contents, :name

  def initialize(room_name, contents = [])
    @name = room_name
    @contents = contents
  end

  def move_left
    nil
  end

  def move_right
    nil
  end

  def move_up
    nil
  end

  def move_down
    nil
  end

  def print_room
    puts "The #{@name} of a space station. It contains:"
    if @contents.nil? || @contents.empty?
      puts "Nothing of interest." 
    else 
      puts @contents
    end
  end

end