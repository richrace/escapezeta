require 'spec_helper'
require 'rooms/mess_hall'

describe MessHall do

  describe "#initialize" do

    it "will have Mess Hall set as it's name" do
      test_string = "Mess Hall"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end