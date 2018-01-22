class SumOfMultiples

# Given a number, find the sum of all the multiples of particular numbers up to
# but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6 and 9, 10, 12, 15, and 18.

# The sum of these multiples is 78.

# Given a number, find the sum of the multiples of a given set of numbers,
# up to but not including that number.


  def initialize *numbers
    @mods = numbers.to_a
  end

  def to num
    sum = 0
    (1...num).each do |n|
      @mods.each do |mod|
        if n % mod == 0
          sum = sum + n
          break
        end
      end
    end

    sum
  end
end

module BookKeeping
  VERSION =2
end
