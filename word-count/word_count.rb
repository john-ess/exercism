class Phrase
  def initialize phrase
    @phrase = phrase
  end

  def word_list
    @words ||= @phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    word_list
    unique = @words.uniq
    unique.each_with_object({}) do |word, counts|
      counts[word] = @words.count(word)
    end

  end
end

module BookKeeping
  VERSION = 1
end
