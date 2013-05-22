require 'game/items/item'
require 'game/items/foot_locker'

describe FootLocker do

  before(:each) do
    @locker = FootLocker.new
  end

  describe "#initialize" do
    it "will set the name correctly" do      
      @locker.name.should eq "Foot Locker"
    end

    it "will set the options correctly" do
      @locker.wearable?.should be_false
      @locker.usable?.should be_true
      @locker.takeable?.should be_false
      @locker.closed?.should be_true
    end

    it "will have the correct items in it" do
      @locker.contents.should have(3).items
      @locker.contents[0].name.should eq "Family Photos"
      @locker.contents[1].name.should eq "Underwear"
      @locker.contents[2].name.should eq "Keycard"
    end
  end

end