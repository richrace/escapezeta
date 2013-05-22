require 'spec_helper'
require 'rooms/science_lab'

describe ScienceLab do

  before(:each) do
    @room = ScienceLab.new
  end

  describe "#initialize" do
    it "will have Science Lab set as it's name" do      
      @room.name.should eq "Science Lab"
    end

    it "will have the correct contents" do
      @room.contents.should have(3).items
      @room.contents[0].name.should eq "Plasma Cutter"
      @room.contents[1].name.should eq "Chemicals"
      @room.contents[2].name.should eq "USB Drive"
    end
  end

  describe "#move_up" do
    it "will give Mess Hall" do
      @room.move_up.should eq MessHall
    end
  end

  describe "#move_down" do
    it "will give Air Lock" do
      @room.move_down.should eq AirLock
    end
  end

  describe "#move_right" do
    it "will give Crew Quarters" do
      @room.move_right.should eq CrewQuarters
    end
  end
  
end