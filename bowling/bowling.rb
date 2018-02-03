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
    @spare        = false                                     # keep track of whether to add to previous frame
    @strike       = Hash.new { |hash, key| hash[key] = '' }   # array of frames with strikes
    @game_over    = false
  end

  def record balls
    if !@game_over
      balls.each do |ball|
        roll ball
      end
    end
  end

  def add_spare frame, pins
    @frame_score[@frame - 1] << pins
    @spare = false
  end

  def add_strike frame, pins
    puts @strike
    @strike.each do |frame, balls|
      @frame_score[frame] << pins
      @strike[frame] -= 1
      @strike.delete(frame) if balls == 0
    end
  end

  def roll pins
    raise BowlingError.new('Each ball must be be between 0 - 10.') unless (0..10).include?(pins)

    add_spare(@frame, pins) if @spare
    add_strike(@frame, pins) if !@strike.empty?

    if @frame <= 10
      @frame_score[@frame] << pins
    end

    if @frame_score[@frame].reduce(:+) == 10 && @frame_score[@frame].count == 2
      @spare   = true
    elsif @frame_score[@frame].reduce(:+) == 10 && @frame_score[@frame].count == 1
      @strike[@frame] = 1
      @frame += 1
    end


    if @frame > 10 && !@spare
      @frame += 1
    elsif @frame == 10 && @strike.empty? && !@spare && @frame_score[@frame].count == 2
      @game_over = true
    elsif @frame_score[@frame].count == 2
      @frame += 1
    end

  end

  def score
    puts @frame_score
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

# score getter method
# check total fromes, return error if not 10
