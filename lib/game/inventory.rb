class Inventory
  attr_accessor :items

  def initialize
    @items = [Item.new("Hairbrush", {:wearable => false, :useable => true, :takeable => true})]
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