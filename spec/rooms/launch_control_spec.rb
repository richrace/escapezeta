require 'spec_helper'
require 'rooms/launch_control'

describe LaunchControl do

  before(:each) do
    @room = LaunchControl.new
  end

  describe "#initialize" do
    it "will have launch control set as it's name" do      
      @room.name.should eq "Launch Control"
    end

    it "will have the correct items in it" do
      @room.items.should have(4).items
      @room.items[0].name.should eq "Schematics"
      @room.items[1].name.should eq "First Aid Kit"
      @room.items[2].name.should eq "Coffee Mug"
      @room.items[3].name.should eq "Launch Dome Control"
    end
  end

  describe "#move_up" do
    it "will give Launch Pad" do
      @room.move_up.should eq LaunchPad
    end
  end

  describe "#move_down" do
    it "will give Crew Quarters" do
      @room.move_down.should eq CrewQuarters
    end
  end

  describe "#move_left" do
    it "will give Mess Hall" do
      @room.move_left.should eq MessHall
    end
  end
  
end