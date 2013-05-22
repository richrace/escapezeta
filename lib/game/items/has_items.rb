module HasItems
  attr_accessor :items

  def find_item(item_name)
    (@items.select {|item| item.name.downcase.eql? item_name.downcase }).first
  end

  def find_and_remove_item(item_name)
    found_item = find_item item_name
    @items.delete found_item if found_item
  end

  def find_takeable_item(item_name)
    found_item = find_item item_name
    found_item if found_item && found_item.takeable?
  end

  def find_and_remove_takeable_item(item_name)
    found_item = find_takeable_item item_name
    @items.delete found_item if found_item 
  end

  def find_usable_item(item_name)
    found_item = find_item item_name
    found_item if found_item && found_item.usable?
  end

  def find_wearable_item(item_name)
    found_item = find_item item_name
    found_item if found_item && found_item.wearable?
  end

  def find_and_remove_wearable_item(item_name)
    found_item = find_wearable_item item_name
    @items.delete found_item if found_item
  end

end