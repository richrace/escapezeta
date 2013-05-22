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

    @items << Item.new("Schematics", {:takeable => true, :usable => true, :wearable => false})
    @items << Item.new("First Aid Kit", {:takeable => true, :usable => true, :wearable => false})
    @items << Item.new("Coffee Mug", {:takeable => true, :usable => false, :wearable => false})
    @items << Item.new("Launch Dome Control", {:takeable => false, :usable => true, :wearable => false})
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