require 'rooms/room'
require 'rooms/launch_control'
require 'rooms/science_lab'
require 'game/items/item'
require 'game/items/foot_locker'

class CrewQuarters < Room
  
  def initialize
    super("Crew Quarters")
    
    @items << FootLocker.new
    @items << Item.new("Soap", {:takeable => true, :usable => true, :wearable => false})
    @items << Item.new("Blanket", {:takeable => true, :usable => true, :wearable => true})
    @items << Item.new("Toothbrush", {:takeable => true, :usable => true, :wearable => false})
  end

  def move_up
    LaunchControl
  end

  def move_left
    ScienceLab
  end

end