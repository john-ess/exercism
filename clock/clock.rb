# why is test_clocks_a_minute_apart failing?

class Clock
 attr_accessor :hours, :minutes

  def self.at(hours, minutes)
    new((hours * 60) + minutes)
  end

  def initialize(minutes)
    @minutes = minutes
  end

  def add(minutes)
    @minutes += minutes
  end

  def to_s
    format('%02d:%02d', (minutes / 60) % 24, minutes % 60)
  end

  def +(other)
    self.class.new(@minutes + other)
  end

  def ==(other)
    to_s == other.to_s
  end
end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end
