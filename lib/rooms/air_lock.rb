require 'rooms/room'
require 'rooms/science_lab'

class AirLock < Room

  def initialize
    super("Air Lock")
  end

  def move_up 
    ScienceLab.new
  end
end