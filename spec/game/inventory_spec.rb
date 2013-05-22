require 'spec_helper'
require 'game/inventory'

describe Inventory do
  
  before(:each) do 
    @inventory = Inventory.new
  end

  describe "#initialize" do
    it "will contain a hairbrush by default" do
      @inventory.items.should have(1).items
      @inventory.items.first.name.should eq "Hairbrush"
    end
  end 

end