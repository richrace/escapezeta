require 'spec_helper'
require 'game/player'

describe Player do
  
  describe "#initialize" do

    it "can give a player a name" do
      test_string = "Rich"
      player = Player.new test_string
      player.name.should eq test_string
    end
    
  end

end