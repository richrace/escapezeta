require 'rooms/room'
require 'rooms/rocket'
require 'rooms/launch_control'

class LaunchPad < Room

  def initialize
    super("Launch Pad")
  end

  def move_up
    Rocket
  end

  def move_down
    LaunchControl
  end

end