class Scrabble
  # fails test_convenient_scoring

  SCORE_HASH = {
                1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
                2 => ['D', 'G'],
                3 => ['B', 'C', 'M', 'P'],
                4 => ['F', 'H', 'V', 'W', 'Y'],
                5 => ['K'],
                8 => ['J', 'X'],
                10 => ['Q', 'Z']
              }

  def initialize word
    @letters = word.to_s.strip.upcase.chars
    @total   = 0
  end

  def self.score(word)
    new(word).score
  end

  def score
    @letters.each do |letter|
      SCORE_HASH.each do |score,letters|
        next unless letters.include?(letter)
        @total += score
      end
    end
    return @total
  end


end
