require 'rooms/room'
require 'rooms/launch_pad'
require 'rooms/crew_quarters'
require 'rooms/mess_hall'

class LaunchControl < Room
  attr_accessor :closed
  alias :closed? :closed

  def initialize
    super("Launch Control")
    @closed = true

    @contents << Item.new("Schematics", {:takeable => true, :usable => true, :wearable => false})
    @contents << Item.new("First Aid Kit", {:takeable => true, :usable => true, :wearable => false})
    @contents << Item.new("Coffee Mug", {:takeable => true, :usable => false, :wearable => false})
    @contents << Item.new("Launch Dome Control", {:takeable => false, :usable => true, :wearable => false})
  end

  def move_up
    if @closed
      puts "Doors are closed!"
      nil
    else
      LaunchPad
    end
  end 
  
  def move_down
    CrewQuarters
  end

  def move_left
    MessHall
  end

end