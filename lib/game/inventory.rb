class Inventory
  attr_accessor :items

  def initialize
    @items = [Item.new("Hairbrush", {:wearable => true, :useable => true, :takeable => true})]
  end

  def print_contents
    puts "You are carrying:"
    @items.each {|item| puts item.name}
  end

end