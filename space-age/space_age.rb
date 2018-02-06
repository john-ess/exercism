# Dynamic Method: http://rohitrox.github.io/2013/07/02/ruby-dynamic-methods/
# Loop through constants: https://stackoverflow.com/questions/6712621/ruby-iterating-through-constants

class SpaceAge
  EARTH_YEAR_IN_SECONDS = 365.25 * 60 * 60 * 24

  ORBIT_MULTIPLES = { 'earth' =>  1,
    'mercury' => 0.2408467,
    'venus'   => 0.61519726,
    'mars'    => 1.8808158,
    'jupiter' => 11.862615,
    'saturn'  => 29.447498,
    'uranus'  => 84.016846,
    'neptune' => 164.79132 }

  def initialize seconds
    @age_in_seconds = seconds
  end

  ORBIT_MULTIPLES.each do |planet, multiple|
    define_method "on_#{planet}" do
      @age_in_seconds / (EARTH_YEAR_IN_SECONDS * multiple)
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
