require 'game/items/has_items'

class Inventory 
  include HasItems

  def initialize
    @items = [Item.new("Hairbrush", {:wearable => false, :usable => true, :takeable => true})]
  end

  def print_contents
    if @items.size > 0
      puts "You are carrying:"
      @items.each {|item| puts item.name}
    else
      puts "You're not carrying anything!"
    end
  end

end