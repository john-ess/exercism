class PrimeFactors
  require 'prime'

  def self.for number
    Prime
      .prime_division(number)
      .each_with_object([]) do |(factor, num_times), divisors|
        divisors.fill(factor, divisors.length, num_times)
      end
  end

end
