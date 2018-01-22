# second draft

class SumOfMultiples

  def initialize *numbers
    @mods = numbers.to_a
  end

  def to num
    sum = 0
    (1...num).each do |n|
      sum = sum + n if @mods.any? { |mod| n % mod == 0 }
    end
    sum
  end
end

module BookKeeping
  VERSION =2
end
