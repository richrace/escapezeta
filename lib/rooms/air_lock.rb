require 'rooms/room'
require 'rooms/science_lab'
require 'game/items/item'

class AirLock < Room
  attr_accessor :open
  alias :open? :open

  def initialize
    super("Air Lock")
    @open = false
    @items << Item.new("Spacesuit", {:wearable => true, :usable => true, :takeable => true})
    @items << Item.new("Clipboard", {:wearable => false, :usable => false, :takeable => true})
    @items << Item.new("Flashlight", {:wearable => false, :usable => true, :takeable => true})
  end

  def move_up 
    ScienceLab
  end

end