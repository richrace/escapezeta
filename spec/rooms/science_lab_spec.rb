require 'spec_helper'
require 'rooms/science_lab'

describe ScienceLab do

  describe "#initialize" do

    it "will have Science Lab set as it's name" do
      test_string = "Science Lab"
      room = Room.new test_string
      room.name.should eq test_string
    end

  end
  
end