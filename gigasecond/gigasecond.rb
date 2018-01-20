class Gigasecond
  # Calculate the moment when someone has lived for 10^9 seconds.
  def self.from(birth_date_time)
    birth_date_time + 10**9
  end
end

module BookKeeping
  VERSION = 6 # Where the version number matches the one in the test.
end
