require 'game/menu'
require 'game/items/has_items'

class Room 
  include HasItems
  attr_accessor :name

  def initialize(room_name, contents = [])
    @name = room_name
    @items = contents
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
    if @items.nil? || @items.empty?
      puts "Nothing of interest." 
    else 
      @items.each {|item| puts item.name}
    end
  end


end