class Pangram
  # determine whether a sentence uses every letter of the alphabet
  def self.pangram? sentence
    ('a'..'z').all?(&sentence.downcase.method(:include?))
  end
end

module BookKeeping
  VERSION = 6
end
