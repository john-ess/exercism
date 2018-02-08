class Grains
  FIRST = 1
  LAST  = 64

  def self.square num
    raise ArgumentError.new('Must be a square on a chess board.') unless num.between?(FIRST, LAST)
    2 ** (num - 1)
  end

  def self.total
    (FIRST..LAST).sum(&method(:square))              # ruby 2.4.1
    # CHESS_SQUARES.reduce{ |sum, i| sum += square i } ruby 2.3.1
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
