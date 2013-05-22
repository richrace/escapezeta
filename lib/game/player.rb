class Player
  attr_accessor :name

  def initialize(player_name)
    @name = player_name
  end

  def print_name
    puts "Your name is: #{@name}"
  end
end