# this works, but...
# ...and there's prob a better enumerator

class Array
  def accumulate(&action)
    return self.to_enum if action.class == NilClass

    output = Array.new
    self.each do |object|
      output << item_val(object, &action)
    end
    output
  end

  def item_val(item, &action)
    return action.call item
  end
end

module BookKeeping
  VERSION = 1
end
