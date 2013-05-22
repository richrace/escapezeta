require 'rooms/room'
require 'rooms/launch_control'
require 'rooms/science_lab'

class CrewQuarters < Room
  
  def initialize
    super("Crew Quarters")
  end

  def move_up
    LaunchControl
  end

  def move_left
    ScienceLab
  end

end