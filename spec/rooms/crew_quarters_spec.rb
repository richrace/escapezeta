require 'spec_helper'
require 'rooms/crew_quarters'

describe CrewQuarters do

  describe "#initialize" do

    it "will have Crew Quarters set as it's name" do
      test_string = "Crew Quarters"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end