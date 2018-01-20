# Convert a binary number, represented as a string (e.g. '101010'),
# to its decimal equivalent using first principles.

class Binary
  def self.to_decimal binary
    raise ArgumentError.new('Binary numbers consist of 1s and 0s only.') unless binary.scan(/([1])|([0])/).join == binary
    return 0 if binary.to_i.zero?

    x = binary.reverse
    total = 0
    x.chars.each_with_index { |num, i|
        total = total + num.to_i * (2 ** i.to_i)
    }
    return total

  end

end

module BookKeeping
  VERSION = 3
end
