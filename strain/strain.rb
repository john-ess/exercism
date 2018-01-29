class Array
  def keep
    each_with_object([]) { |i, kept_items| kept_items << i if yield(i) }
  end

  def discard
    each_with_object([]) { |i, discarded_items|  discarded_items << i unless yield(i) }
  end
end
