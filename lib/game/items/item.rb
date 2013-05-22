class Item
  attr_accessor :usable, :wearable, :takeable, :name
  alias :usable? :usable
  alias :wearable? :wearable
  alias :takeable? :takeable

  def initialize(item_name, options = {})
    @name = item_name
    @usable = options[:usable] || false
    @wearable = options[:wearable] || false
    @takeable = options[:takeable] || false
  end
  
end