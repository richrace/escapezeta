require './lib/rooms/room'
require './lib/rooms/science_lab'

class AirLock < Room

  def initialize
    super("Air Lock" , ["Spacesuit", "Clipboard", "Flashlight"])
  end

  def move_up 
    ScienceLab.new
  end

end