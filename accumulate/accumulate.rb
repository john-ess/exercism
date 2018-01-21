# this works, but...
# doesn't handle test_no_block_is_passed

class Array
  def accumulate(&action)
    self.map do |object|
      action.call object
    end
  end
end

module BookKeeping
  VERSION = 1
end
