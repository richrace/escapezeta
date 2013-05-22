require 'spec_helper'
require 'rooms/room'

describe Room do

  before(:each) do
    @test_string = "Test Room"
    @room = Room.new @test_string
  end

  describe "#initialize" do
    it "will set a name when passed as param" do      
      @room.name.should eq @test_string
    end
  end

  describe "#move_right" do
    it "will get it cannot move message" do
      @room.move_right.should be_nil
    end 
  end
  
  describe "#move_left" do
    it "will get it cannot move message" do
      @room.move_left.should be_nil
    end 
  end

  describe "#move_up" do
    it "will get it cannot move message" do
      @room.move_up.should be_nil
    end 
  end

  describe "#move_down" do
    it "will get it cannot move message" do
      @room.move_down.should be_nil
    end 
  end

end