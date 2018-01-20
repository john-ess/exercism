class Grains
  def self.square num
    raise ArgumentError.new('Must be a number on a chess board.') unless num >= 1 && num <= 64
    2 ** (num - 1)
  end

  def self.total
    (1..64).reduce { |sum, i| sum += square i }
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
