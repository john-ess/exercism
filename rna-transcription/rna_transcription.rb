class Complement
  # Given a DNA strand, its transcribed RNA strand is formed by replacing
  # each nucleotide with its complement:
  #   `G` -> `C`
  #   `C` -> `G`
  #   `T` -> `A`
  #   `A` -> `U`
  def self.of_dna(strand)
    # return blank if invalid neucleotide
    #   see http://rubular.com
    #   [^GCTA] - match any character that *is not* in the group
    return '' if strand.match(/[^GCTA]/)
    # tr method (translate) is explained well here:
    #   https://stackoverflow.com/questions/26749065/what-is-the-difference-between-tr-and-gsub
    strand.tr('GCTA','CGAU')
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end
