class Anagram

  def initialize word
    @word              = word
    @standardized_word = standardize @word
    @downcased_word    = word.downcase
  end

  def standardize word
    return word.downcase.chars.sort.join
  end

  def match check_word_against
    check_word_against.reject! { |candidate| candidate.downcase == @downcased_word }
    check_word_against.select do |candidate|
      standardize(candidate) == @standardized_word
    end
  end

end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end
