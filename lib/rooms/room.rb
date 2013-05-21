class Room
  CANNOT_MOVE = "You can't go that way!"

  attr_accessor :contents, :name

  def initialize(room_name)
    @name = room_name
  end

  def move_left
    CANNOT_MOVE
  end

  def move_right
    CANNOT_MOVE
  end

  def move_up
    CANNOT_MOVE
  end

  def move_down
    CANNOT_MOVE
  end

end