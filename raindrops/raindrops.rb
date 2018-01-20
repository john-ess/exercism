class Raindrops
  # If the number has 3 as a factor, output 'Pling'.
  # If the number has 5 as a factor, output 'Plang'.
  # If the number has 7 as a factor, output 'Plong'.
  # If the number does not have 3, 5, or 7 as a factor,
  #   just pass the number's digits straight through.

  FACTOR_TO_STRING  = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(num)
    converted = FACTOR_TO_STRING.select { |f, _| num % f == 0 }
    return (converted.empty?) ? num.to_s : converted.values.join
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
