require 'spec_helper'
require 'rooms/launch_pad'

describe LaunchPad do

  describe "#initialize" do

    it "will have launch pad set as it's name" do
      room = LaunchPad.new 
      room.name.should eq "Launch Pad"
    end

  end
  
end