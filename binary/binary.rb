class Binary
  def self.to_decimal input
    raise ArgumentError.new('Binary numbers consist of 1s and 0s only.') if input.scan(/([1])|([0])/).length != input.length
  end

end
