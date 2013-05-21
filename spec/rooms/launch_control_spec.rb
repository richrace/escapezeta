require 'spec_helper'
require 'rooms/launch_control'

describe LaunchControl do

  describe "#initialize" do

    it "will have launch control set as it's name" do
      room = LaunchControl.new 
      room.name.should eq "Launch Control"
    end

  end
  
end