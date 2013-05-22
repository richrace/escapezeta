require 'rooms/room'
require 'rooms/launch_control'
require 'rooms/science_lab'
require 'game/items/item'
require 'game/items/foot_locker'

class CrewQuarters < Room
  
  def initialize
    super("Crew Quarters")
    
    @contents << FootLocker.new
    @contents << Item.new("Soap", {:takeable => true, :usable => true, :wearable => false})
    @contents << Item.new("Blanket", {:takeable => true, :usable => true, :wearable => true})
    @contents << Item.new("Toothbrush", {:takeable => true, :usable => true, :wearable => false})
  end

  def move_up
    LaunchControl
  end

  def move_left
    ScienceLab
  end

end