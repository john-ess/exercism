class Year
  # on every year that is evenly divisible by 4
  # except every year that is evenly divisible by 100
  #   unless the year is also evenly divisible by 400
  def self.leap?(year)
    # integrates tenebrousedge's suggestion
    #  remove primitive values (i.e. 0)
    year.modulo(4).zero? &&
      year.modulo(100).nonzero? ||
        year.modulo(400).zero?
  end
end

module BookKeeping
  VERSION = 3
end
