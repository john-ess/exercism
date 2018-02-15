# Passes tests, but this is a mess.
# Will clean up

class Game

  FIRST_BALL  = 1
  SECOND_BALL = 2
  ALL_PINS    = 10
  LAST        = 10

  def initialize
    @score        = 0
    @frame        = 1
    @frame_score  = Hash.new { |hash, key| hash[key] = [] }
    @spare_strike = Hash.new { |hash, key| hash[key] = '' }
  end

  def record balls
    balls.each(&:roll)
  end

  def score_extra pins
    @spare_strike.each do |frame, extra|
      next if frame == @frame

      @frame_score[frame] << pins
      @spare_strike[frame] -= 1
      @spare_strike.delete(frame) if extra <= 1
    end
  end

  def strike
    @spare_strike[@frame] = 2
    advance_frame         unless @frame == LAST
  end

  def spare
    @spare_strike[@frame] = 1
  end

  def advance_frame
    @frame += 1
  end

  def roll pins
    raise BowlingError.new('Game is over.') if @frame == LAST && @frame_score[@frame].count == 2 && @spare_strike.empty?
    raise BowlingError.new('Each ball must be be between 0 - 10.') unless (0..10).include?(pins)

    score_extra pins if @spare_strike.any?

    if @frame_score[@frame].empty?
      @frame_score[@frame] << pins
      strike if pins == ALL_PINS
    elsif @frame_score[@frame].count == 1
      raise BowlingError.new('Score must be less than 10 in regular frame') if @frame_score[@frame][0] != ALL_PINS && @frame_score[@frame][0] + pins > ALL_PINS

      @frame_score[@frame] << pins
      spare if @frame_score[@frame].reduce(:+) == 10
      advance_frame if @frame != LAST
    elsif @frame == LAST && @spare_strike.any? && @frame_score[@frame].count == 2
      raise BowlingError.new('Last two pins must be less than 10') if pins != 10 && @frame_score[10][FIRST_BALL] < ALL_PINS && @frame_score[10][FIRST_BALL] + pins > ALL_PINS || @frame_score[10][0] == 10 && @frame_score[10][FIRST_BALL] < 10 && @frame_score[10][FIRST_BALL] + pins > 10

      @frame_score[@frame] << pins
      @spare_strike.clear
    end

  end

  def score
    raise BowlingError.new('Game is not done') if @frame < LAST || @frame == LAST && @spare_strike.any?

    @frame_score.map { |k,v| v.reduce(:+) }.reduce(:+)
  end
end


class BowlingError < StandardError
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
