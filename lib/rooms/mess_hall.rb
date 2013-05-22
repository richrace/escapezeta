require 'rooms/room'
require 'rooms/science_lab'
require 'rooms/launch_control'

class MessHall < Room

  def initialize
    super("Mess Hall")

    @contents << Item.new("Rations", {:takable => true, :useable => true, :wearable => false})
    @contents << Item.new("Rags", {:takable => true, :useable => true, :wearable => true})
    @contents << Item.new("Bleach", {:takable => true, :useable => false, :wearable => false})
  end

  def move_down
    ScienceLab
  end

  def move_right
    LaunchControl
  end

end