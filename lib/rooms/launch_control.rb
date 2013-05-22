require 'rooms/room'
require 'rooms/launch_pad'
require 'rooms/crew_quarters'
require 'rooms/mess_hall'

class LaunchControl < Room
  
  def initialize
    super("Launch Control")

    @contents << Item.new("Schematics", {:takable => true, :useable => true, :wearable => false})
    @contents << Item.new("First Aid Kit", {:takable => true, :useable => true, :wearable => false})
    @contents << Item.new("Coffee Mug", {:takable => true, :useable => false, :wearable => false})
    @contents << Item.new("Launch Dome Control", {:takable => false, :useable => true, :wearable => false})
  end

  def move_up
    LaunchPad
  end 
  
  def move_down
    CrewQuarters
  end

  def move_left
    MessHall
  end

end