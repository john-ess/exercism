# this works, but...
# ...doesn't handle test_no_block_is_passed
# ...and there's prob a better enumerator

class Array
  def accumulate(&action)
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
