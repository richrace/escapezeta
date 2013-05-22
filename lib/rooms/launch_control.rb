require 'rooms/room'
require 'rooms/launch_pad'
require 'rooms/crew_quarters'
require 'rooms/mess_hall'

class LaunchControl < Room
  
  def initialize
    super("Launch Control")
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