require 'game/items/item'

describe Item do

  describe "#initialize" do
    it "can set a name without any options" do
      item = Item.new "Test Item"
      item.name.should eq "Test Item"
      item.wearable?.should be_false
      item.usable?.should be_false
      item.takeable?.should be_false
    end

    it "can set up an item with wearable set to true" do
      item = Item.new("Test Item", {:wearable => true})
      item.wearable?.should be_true
    end

    it "can set up an item with usable set to true" do
      item = Item.new("Test Item", {:usable => true})
      item.usable?.should be_true
    end

    it "can set up an item with takeable set to true" do
      item = Item.new("Test Item", {:takeable => true})
      item.takeable?.should be_true
    end

    it "can set up an item with wearable and usable set to true" do
      item = Item.new("Test Item", {:wearable => true, :usable => true})
      item.wearable?.should be_true
      item.usable?.should be_true
      item.takeable?.should be_false
    end
  end

end