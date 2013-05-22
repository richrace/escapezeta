require 'spec_helper'
require 'rooms/crew_quarters'

describe CrewQuarters do

  before(:each) do
    @room = CrewQuarters.new
  end

  describe "#initialize" do

    it "will have Crew Quarters set as it's name" do      
      @room.name.should eq "Crew Quarters"
    end

    it "will have the correct number of items" do
      @room.contents.should have(4).items
      @room.contents[0].name.should eq "Foot Locker"
      @room.contents[1].name.should eq "Soap"
      @room.contents[2].name.should eq "Blanket"
      @room.contents[3].name.should eq "Toothbrush"
    end

  end

  describe "#move_up" do
    it "will give you Launch Control" do
      @room.move_up.should eq LaunchControl
    end
  end

  describe "#move_left" do
    it "will give you Science Lab" do
      @room.move_left.should eq ScienceLab
    end
  end
  
end