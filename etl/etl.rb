class ETL

  def self.transform old
    old.each_with_object({}) do |(score,letters), memo|
      letters.each_with_object({}) { |letter| memo[letter.downcase] = score }
    end
  end
end


module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
