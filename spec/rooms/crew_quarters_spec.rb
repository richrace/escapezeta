require 'spec_helper'
require 'rooms/crew_quarters'

describe CrewQuarters do

  describe "#initialize" do

    it "will have Crew Quarters set as it's name" do
      room = CrewQuarters.new
      room.name.should eq "Crew Quarters"
    end

  end
  
end