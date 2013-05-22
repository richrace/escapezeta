require 'spec_helper'
require 'rooms/mess_hall'

describe MessHall do

  before(:each) do
    @room = MessHall.new
  end

  describe "#initialize" do
    it "will have Mess Hall set as it's name" do      
      @room.name.should eq "Mess Hall"
    end

    it "will have the correct contents" do
      @room.contents.should have(3).items
      @room.contents[0].name.should eq "Rations"
      @room.contents[1].name.should eq "Rags"
      @room.contents[2].name.should eq "Bleach"
    end
  end

  describe "#move_down" do
    it "will give Science Lab" do
      @room.move_down.should eq ScienceLab
    end
  end

  describe "#move_right" do
    it "will give Launch Control" do
      @room.move_right.should eq LaunchControl
    end
  end
  
end