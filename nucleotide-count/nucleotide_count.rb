class Nucleotide
  ADENOSINES = [ 'A',
                 'T',
                 'C',
                 'G' ]

  def initialize strand
    @counts = ADENOSINES.map { |adenosine| [adenosine, 0] }.to_h
    strand.each_char do |dna|
      valid_nucelotide?(dna)
      @counts[dna] += 1
    end
  end

  def self.from_dna strand
    new(strand)
  end

  def count(adenosine)
    valid_nucelotide?(adenosine)
    return ADENOSINES.include?(adenosine) ? @counts[adenosine] : 0
  end

  def histogram
    @counts
  end

  private
  def valid_nucelotide?(adenosine)
    raise ArgumentError.new('You did not provide a strand of DNA') unless ADENOSINES.include?(adenosine)
  end
end
