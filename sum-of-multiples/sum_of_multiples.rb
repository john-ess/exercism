class SumOfMultiples

  def initialize *numbers
    @mods = numbers.to_a
  end

  def to num
    (1...num).select { |n| @mods.any? { |mod| n % mod == 0 } }.reduce(0,:+)
  end
end

module BookKeeping
  VERSION =2
end
