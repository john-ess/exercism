# Dynamic Method: http://rohitrox.github.io/2013/07/02/ruby-dynamic-methods/
# Loop through constants: https://stackoverflow.com/questions/6712621/ruby-iterating-through-constants
module Planets
  EARTH   =  1
  MERCURY =  0.2408467
  VENUS   =  0.61519726
  MARS    =  1.8808158
  JUPITER =  11.862615
  SATURN  =  29.447498
  URANUS  =  84.016846
  NEPTUNE =  164.79132
end

class SpaceAge
  EARTH_YEAR_IN_SECONDS = 365.25 * 60 * 60 * 24

  def initialize seconds
    @age_in_seconds = seconds
  end

  Planets.constants.each do |method|
    define_method "on_#{method.downcase}" do
      @age_in_seconds / (EARTH_YEAR_IN_SECONDS * Planets.const_get(method.upcase))
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
