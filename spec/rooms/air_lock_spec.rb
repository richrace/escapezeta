require 'spec_helper'
require 'rooms/air_lock'

describe AirLock do

  describe "#initialize" do

    it "will have Air Lock set as it's name" do
      test_string = "Air Lock"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end