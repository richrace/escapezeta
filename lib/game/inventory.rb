class Inventory
  attr_accessor :items

  def initialize
    @items = ["Hairbrush"]
  end

  def print_contents
    puts "You are carrying:"
    puts @items
  end

end