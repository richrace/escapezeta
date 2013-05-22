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
      @room.contents.should have(4).items
      @room.contents[0].name.should eq "Schematics"
      @room.contents[1].name.should eq "First Aid Kit"
      @room.contents[2].name.should eq "Coffee Mug"
      @room.contents[3].name.should eq "Launch Dome Control"
    end
  end

  describe "#move_up" do
    it "will give Launch Pad when the doors are open" do
      @room.closed = false
      @room.closed?.should be_false
      @room.move_up.should eq LaunchPad
    end

    it "will give nil when the doors are closed" do
      @room.closed = true
      @room.closed?.should be_true
      @room.move_up.should be_nil
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