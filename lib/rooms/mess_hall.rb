require 'rooms/room'
require 'rooms/science_lab'
require 'rooms/launch_control'

class MessHall < Room

  def initialize
    super("Mess Hall")

    @items << Item.new("Rations", {:takeable => true, :usable => true, :wearable => false})
    @items << Item.new("Rags", {:takeable => true, :usable => true, :wearable => true})
    @items << Item.new("Bleach", {:takeable => true, :usable => false, :wearable => false})
  end

  def move_down
    ScienceLab
  end

  def move_right
    LaunchControl
  end

end