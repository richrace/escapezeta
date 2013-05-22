require 'spec_helper'
require 'game/items/item'
require 'game/items/has_items'

describe HasItems do

  class DummyObject 
    include HasItems
    def initialize
      @items = []
    end
  end

  before(:each) do
    @item_obj = DummyObject.new
    @item_obj.items << Item.new("Hairbrush", {:wearable => false, :usable => true, :takeable => true})
  end

  describe "#find_item" do
    it "will find the hairbrush from the default list" do
      found = @item_obj.find_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
    end

    it "will find the hairbrush from the default list; ignoring the case" do
      found = @item_obj.find_item "haiRBrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
    end

    it "will find the hairbrush from a list of items" do
      @item_obj.items << Item.new("Schematics", {:takeable => true, :usable => true, :wearable => false})
      @item_obj.items << Item.new("First Aid Kit", {:takeable => true, :usable => true, :wearable => false})
      @item_obj.items.should have(3).items
      found = @item_obj.find_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
    end

    it "will not error when an item isn't in the list" do
      found = @item_obj.find_item "Banana"
      found.should be_nil
    end
  end

  describe "#find_and_remove_item" do
    it "will find and remove the hairbrush item" do
      found = @item_obj.find_and_remove_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
      @item_obj.items.should be_empty
    end

    it "will won't find something not in the list and won't error" do
      found = @item_obj.find_and_remove_item "Banana"
      found.should be_nil
      @item_obj.items.should have(1).items
    end
  end

  describe "#find_takeable_item" do
    it "will find a takeable item" do
      found = @item_obj.find_takeable_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
    end

    it "will not get an item which isn't takeable" do
      @item_obj.items << Item.new("Big Rock", {:takeable => false, :usable => true, :wearable => false})
      found = @item_obj.find_takeable_item "Big Rock"
      found.should be_nil
    end
  end

  describe "#find_and_remove_takeable_item" do
    it "will find a takeable item and remove it" do      
      found = @item_obj.find_and_remove_takeable_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
      @item_obj.find_item("Hairbrush").should be_nil
    end

    it "will not get an item which isn't takeable" do
      @item_obj.items << Item.new("Suit", {:takeable => false, :usable => false, :wearable => true})
      found = @item_obj.find_and_remove_takeable_item "Suit"
      found.should be_nil
    end
  end

  describe "#find_usable_item" do
    it "will find a usable item" do
      found = @item_obj.find_usable_item "Hairbrush"
      found.should_not be_nil
      found.name.should eq "Hairbrush"
    end

    it "will not get an item which isn't usable" do
      @item_obj.items << Item.new("Big Rock", {:takeable => false, :usable => false, :wearable => false})
      found = @item_obj.find_takeable_item "Big Rock"
      found.should be_nil
    end
  end

  describe "#find_wearable_item" do
    it "will find a wearable item and remove it" do
      @item_obj.items << Item.new("Suit", {:takeable => false, :usable => false, :wearable => true})
      found = @item_obj.find_wearable_item "Suit"
      found.should_not be_nil
      found.name.should eq "Suit"
    end

    it "will not get an item which isn't wearable" do      
      found = @item_obj.find_wearable_item "Hairbrush"
      found.should be_nil
    end
  end

  describe "#find_and_remove_wearable_item" do
    it "will find a wearable item and remove it" do
      @item_obj.items << Item.new("Suit", {:takeable => false, :usable => false, :wearable => true})
      found = @item_obj.find_and_remove_wearable_item "Suit"
      found.should_not be_nil
      found.name.should eq "Suit"
      @item_obj.find_item("Suit").should be_nil
    end

    it "will not get an item which isn't wearable" do      
      found = @item_obj.find_and_remove_wearable_item "Hairbrush"
      found.should be_nil
    end
  end
end