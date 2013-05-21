require 'spec_helper'
require 'rooms/science_lab'

describe ScienceLab do

  describe "#initialize" do

    it "will have Science Lab set as it's name" do
      room = ScienceLab.new
      room.name.should eq "Science Lab"
    end

  end
  
end