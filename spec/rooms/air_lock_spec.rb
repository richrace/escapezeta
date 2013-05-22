require 'spec_helper'
require 'rooms/air_lock'
require 'rooms/science_lab'

describe AirLock do

  before(:each) do
    @room = AirLock.new
  end

  describe "#initialize" do

    it "will have Air Lock set as it's name" do      
      @room.name.should eq "Air Lock"
    end

    it "will be closed" do
      @room.open?.should be_false
    end

    it "will have the correct items with it" do
      @room.contents.should have(3).items
      @room.contents[0].name.should eq "Spacesuit"
      @room.contents[1].name.should eq "Clipboard"
      @room.contents[2].name.should eq "Flashlight"
    end

  end

  describe "#move_up" do
    it "will return a science lab object as this is the new room" do
      @room.move_up.should eq ScienceLab
    end
  end
end