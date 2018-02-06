# See: http://rohitrox.github.io/2013/07/02/ruby-dynamic-methods/

class SpaceAge
  EARTH_YEAR_IN_SECONDS = 365.25 * 60 * 60 * 24
  EARTH   =  1
  MERCURY =  0.2408467
  VENUS   =  0.61519726
  MARS    =  1.8808158
  JUPITER =  11.862615
  SATURN  =  29.447498
  URANUS  =  84.016846
  NEPTUNE =  164.79132

  def initialize seconds
    @age_in_seconds = seconds
  end

  def calculate earth_multiple
    @age_in_seconds / (EARTH_YEAR_IN_SECONDS * earth_multiple)
  end

  [:earth, :mercury, :venus, :mars, :jupiter, :saturn, :uranus, :neptune].each do |method|
    define_method "on_#{method}" do
      calculate SpaceAge.const_get(method.upcase)
    end
  end

end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
