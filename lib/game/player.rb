class Player
  attr_accessor :name, :wearing

  def initialize(player_name)
    @name = player_name
    @wearing = []
  end

  def print_name
    puts "Your name is: #{@name}"
  end
end