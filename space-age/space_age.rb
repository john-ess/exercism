# - Earth: orbital period 365.25 Earth days, or 31557600 seconds
# - Mercury: orbital period 0.2408467 Earth years
# - Venus: orbital period 0.61519726 Earth years
# - Mars: orbital period 1.8808158 Earth years
# - Jupiter: orbital period 11.862615 Earth years
# - Saturn: orbital period 29.447498 Earth years
# - Uranus: orbital period 84.016846 Earth years
# - Neptune: orbital period 164.79132 Earth years


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

  attr_accessor :age_in_seconds

  def initialize seconds
    @age_in_seconds = seconds.to_i
  end

  def calculate earth_multiple
    @age_in_seconds / (EARTH_YEAR_IN_SECONDS * earth_multiple)
  end

  def on_earth
    calculate EARTH
  end

  def on_mercury
    calculate MERCURY
  end

  def on_venus
    calculate VENUS
  end

  def on_mars
    calculate MARS
  end

  def on_jupiter
    calculate JUPITER
  end

  def on_saturn
    calculate SATURN
  end

  def on_uranus
    calculate URANUS
  end


  def on_neptune
    calculate NEPTUNE
  end

end



module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
