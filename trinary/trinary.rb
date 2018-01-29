class Trinary
  def initialize trinary
    @trinary = trinary
  end

  def to_decimal
    return 0 if (/[^210]/) =~ @trinary
    #return 0 if @trinary.to_i.zero?

    @trinary.reverse.chars.each_with_index.map { |num, i| num.to_i * (3 ** i) }.reduce(0,:+)
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
