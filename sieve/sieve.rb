class Sieve
  require 'prime'

  def initialize(number)
    @num = number
  end

  def primes
    (2..@num).select { |n| n.prime? }
  end

end

module BookKeeping
  VERSION = 1
end
