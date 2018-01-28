class Array
  def keep
    each.select { |i| yield(i) }
  end

  def discard
    each.reject { |i| yield(i) }
  end
end
