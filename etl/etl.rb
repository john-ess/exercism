class ETL

  def initialize
    @scores = Hash.new
  end

  def self.transform old
    scores = Hash.new
    old.each do |score,letters|
      letters.each_with_object({}) { |letter| scores[letter.downcase] = score }
    end
    scores
  end
end


module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
