class FootLocker < Item
  attr_accessor :contents, :closed
  alias :closed? :closed

  def initialize
    super("Foot Locker", {:usable => true,
                          :wearable => false,
                          :takeable => false})
    @closed = true
    @contents = []

    @contents << Item.new("Family Photos", {:usable => false, :wearable => false, :takeable => true})
    @contents << Item.new("Underwear", {:usable => false, :wearable => false, :takeable => true})
    @contents << Item.new("Keycard", {:usable => true, :wearable => false, :takeable => true})
  end

end