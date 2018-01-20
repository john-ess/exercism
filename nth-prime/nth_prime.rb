
require 'Prime'

class Prime
  def self.nth(num)
    raise ArgumentError.new('There is no 0th prime number') if num == 0
    self.first(num).last
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
