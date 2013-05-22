require './lib/rooms/room'
require './lib/rooms/science_lab'

class AirLock < Room
  attr_accessor :open
  alias :open? :open

  def initialize
    @open = false
    super("Air Lock" , ["Spacesuit", "Clipboard", "Flashlight"])
  end

  def move_up 
    ScienceLab
  end

end