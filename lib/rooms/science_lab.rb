require 'rooms/room'

class ScienceLab < Room
  
  def initialize
    super("Science Lab")

    @contents << Item.new("Plasma Cutter", {:takable => true, :useable => true, :wearable => false})
    @contents << Item.new("Chemicals", {:takable => true, :useable => false, :wearable => false})
    @contents << Item.new("USB Drive", {:takable => true, :useable => false, :wearable => false})
  end

  def move_down
    AirLock
  end

  def move_up
    MessHall
  end

  def move_right
    CrewQuarters
  end

end