# * An open frame is where a score of less than 10 is recorded for the
#   frame. In this case the score for the frame is the number of pins
#   knocked down.

# * A spare is where all ten pins are knocked down by the second
#   throw. The total value of a spare is 10 plus the number of pins
#   knocked down in their next throw.

# * A strike is where all ten pins are knocked down by the first
#   throw. The total value of a strike is 10 plus the number of pins
#   knocked down in the next two throws. If a strike is immediately
#   followed by a second strike, then the value of the first strike
#   cannot be determined until the ball is thrown one more time.

class Game
  def initialize
    @score = 0
  end

  def roll pins
    raise BowlingError.new('Each ball must be be between 0 - 10.') unless (0..10).include?(pins)
  end
end

class BowlingError < StandardError
  def initialize msg="There was an error."
    super
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
