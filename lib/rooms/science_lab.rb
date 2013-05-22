require './lib/rooms/room'

class ScienceLab < Room
  
  def initialize
    super("Science Lab")
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