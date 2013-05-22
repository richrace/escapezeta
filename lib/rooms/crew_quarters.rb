require 'rooms/room'
require 'rooms/launch_control'
require 'rooms/science_lab'

class CrewQuarters < Room
  
  def initialize
    super("Crew Quarters", ["Footlocker", "Soap", "Blanket", "Toothbrush"])
  end

  def move_up
    LaunchControl
  end

  def move_left
    ScienceLab
  end

end