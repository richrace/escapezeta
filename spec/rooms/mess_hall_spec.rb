require 'spec_helper'
require 'rooms/mess_hall'

describe MessHall do

  describe "#initialize" do

    it "will have Mess Hall set as it's name" do
      room = MessHall.new
      room.name.should eq "Mess Hall"
    end

  end
  
end