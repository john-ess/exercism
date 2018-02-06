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
    @score        = 0
    @frame        = 1
    @frame_score  = Hash.new { |hash, key| hash[key] = [] }
    @spare_strike = Hash.new { |hash, key| hash[key] = '' }
    @game_over    = false
  end

  def record balls
    if !@game_over
      balls.each do |ball|
        roll ball
      end
    end
  end

  def score_extra pins
    @spare_strike.each do |frame, balls|
      next if frame == @frame
      @frame_score[frame] << pins
      @spare_strike[frame] -= 1
      @spare_strike.delete(frame) if balls <= 1
    end
  end

  def advance_frame
    @frame = @frame + 1
  end

  def check_frame

  end

  def roll pins
    raise BowlingError.new('Game is over.') if @frame == 10 && @spare_strike.empty? && @frame_score[@frame].count == 2
    raise BowlingError.new('Each ball must be be between 0 - 10.') unless (0..10).include?(pins)

    if @spare_strike.any?
      score_extra(pins)
    end

    if @frame_score[@frame].empty?
      @frame_score[@frame] << pins
      @spare_strike[@frame] = 2 if pins == 10
      advance_frame if pins == 10 && @frame != 10
    elsif @frame_score[@frame].count == 1
      @frame_score[@frame] << pins
      @spare_strike[@frame] = 1 if @frame_score[@frame].reduce(:+) == 10
      advance_frame if @frame != 10
    elsif @frame == 10 && @spare_strike.any?
      @frame_score[@frame] << pins
      @spare_strike.delete(10)
      @game_over = true
    end

  end

  def score
    raise BowlingError.new('Game is not done') if @frame < 10 || (@frame == 10 && @spare_strike.any?)

    @frame_score.map { |k,v| v.reduce(:+) }.reduce(:+)
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
