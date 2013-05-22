class FootLocker < Item
  include HasItems
  attr_accessor :closed
  alias :closed? :closed

  def initialize
    super("Foot Locker", {:usable => true,
                          :wearable => false,
                          :takeable => false})
    @closed = true
    @items = []

    @items << Item.new("Family Photos", {:usable => false, :wearable => false, :takeable => true})
    @items << Item.new("Underwear", {:usable => false, :wearable => false, :takeable => true})
    @items << Item.new("Keycard", {:usable => true, :wearable => false, :takeable => true})
  end

end