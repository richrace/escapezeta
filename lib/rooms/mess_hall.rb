require 'rooms/room'
require 'rooms/science_lab'
require 'rooms/launch_control'

class MessHall < Room

  def initialize
    super("Mess Hall")
  end

  def move_down
    ScienceLab
  end

  def move_right
    LaunchControl
  end

end