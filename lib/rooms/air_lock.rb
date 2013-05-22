require 'rooms/room'
require 'rooms/science_lab'
require 'game/items/item'

class AirLock < Room
  attr_accessor :open
  alias :open? :open

  def initialize
    super("Air Lock")
    @open = false
    @contents << Item.new("Spacesuit", {:wearable => true, :useable => true, :takeable => true})
    @contents << Item.new("Clipboard", {:wearable => false, :useable => false, :takeable => true})
    @contents << Item.new("Flashlight", {:wearable => false, :useable => true, :takeable => true})
  end

  def move_up 
    ScienceLab
  end

end