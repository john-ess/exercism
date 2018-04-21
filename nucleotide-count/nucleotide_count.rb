class Nucleotide
  ADENOSINES = %w[A T C G]

  def initialize dna
    @dna = dna
  end

  def self.from_dna dna
    raise ArgumentError.new('You did not provide a strand of DNA') if dna.chars.uniq.any? { |letter| !ADENOSINES.include?(letter) }
    new(dna)
  end

  def count(adenosine)
    return @dna.count(adenosine)
  end

  def histogram
    ADENOSINES.map {|adenosine| [ adenosine, @dna.count(adenosine) ] }.to_h
  end

end
