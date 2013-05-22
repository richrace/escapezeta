require 'spec_helper'
require 'rooms/launch_pad'

describe LaunchPad do

  before(:each) do
    @room = LaunchPad.new 
  end

  describe "#initialize" do
    it "will have launch pad set as it's name" do      
      @room.name.should eq "Launch Pad"
    end
  end

  describe "#move_up" do
    it "will give Rocket" do
      @room.move_up.should eq Rocket
    end
  end

  describe "#move_down" do
    it "will give Launch Control" do
      @room.move_down.should eq LaunchControl
    end
  end
  
end