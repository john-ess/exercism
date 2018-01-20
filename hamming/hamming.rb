class Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError.new('Strands must be the same length.') unless dna1.length == dna2.length
    # integrates tenebrousedge suggestion to use Enumerable#count
    dna1.each_char.with_index.count { |cell, index| cell != dna2[index] }
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
