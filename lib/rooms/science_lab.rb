require 'rooms/room'

class ScienceLab < Room
  
  def initialize
    super("Science Lab")

    @items << Item.new("Plasma Cutter", {:takeable => true, :usable => true, :wearable => false})
    @items << Item.new("Chemicals", {:takeable => true, :usable => false, :wearable => false})
    @items << Item.new("USB Drive", {:takeable => true, :usable => false, :wearable => false})
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