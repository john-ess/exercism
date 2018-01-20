class Binary
  def self.to_decimal binary
    raise ArgumentError.new('Binary numbers consist of 1s and 0s only.') unless binary.scan(/([1])|([0])/).join == binary
    return 0 if binary.to_i.zero?

    binary.reverse.chars.each_with_index.map { |num, i| num.to_i * (2 ** i)}.reduce(0,:+)
  end
end

module BookKeeping
  VERSION = 3
end
