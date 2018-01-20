class Squares
  # return difference between
  # the square of the sum and the sum of the squares
  # of the first N natural numbers
  attr_accessor :numbers

  def initialize(num)
    @num = 1..num
  end

  def square_of_sum
    @num.reduce(:+) ** 2
  end

  def sum_of_squares
    @num.reduce { |sum, n| sum += n ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end
