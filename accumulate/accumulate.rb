class Array
  def accumulate
    return self.to_enum if !block_given?
    each_with_object([]) { |value, output| output << yield(value) }
  end
end

module BookKeeping
  VERSION = 1
end
