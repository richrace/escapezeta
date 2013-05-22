require 'spec_helper'
require 'game/player'

describe Player do
  
  before(:each) do
    @test_string = "Rich"
    @player = Player.new @test_string
  end

  describe "#initialize" do

    it "can give a player a name" do      
      @player.name.should eq @test_string
    end
    
  end

  describe "#wearing" do
    it "can wear an item" do
      @player.wearing << Item.new("Spacesuit", {:wearable => true, :takeable => true, :usable => true})
      @player.wearing.should have(1).items
      @player.wearing[0].name.should eq "Spacesuit"
    end
  end

end