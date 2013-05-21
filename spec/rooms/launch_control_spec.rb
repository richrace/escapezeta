require 'spec_helper'
require 'rooms/launch_control'

describe LaunchControl do

  describe "#initialize" do

    it "will have launch control set as it's name" do
      test_string = "Launch Control"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end