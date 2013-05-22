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

  end

  describe "#move_up" do
    it "will return a science lab object as this is the new room" do
      @room.move_up.should eq ScienceLab
    end
  end
end