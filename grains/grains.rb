class Grains
  CHESS_SQUARES = (1..64)

  def self.square num
    raise ArgumentError.new('Must be a square on a chess board.') unless CHESS_SQUARES.include? num
    2 ** (num - 1)
  end

  def self.total
    CHESS_SQUARES.reduce { |sum, i| sum += square i }
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
