require 'spec_helper'
require 'rooms/launch_pad'

describe LaunchPad do

  describe "#initialize" do

    it "will have launch pad set as it's name" do
      test_string = "Launch Pad"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end