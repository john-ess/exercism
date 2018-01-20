class RunLengthEncoding
  def self.encode decoded
    decoded.chars.chunk_while(&:==).reduce('') do |encoded, letters|
      encoded << (letters.size == 1 ? letters[0] : "#{letters.size}#{letters[0]}")
    end
  end

  def self.decode encoded
    encoded.scan(/(\d*)(\D)/).reduce('') do |decoded,(count,letter)|
      decoded + letter * ( count.empty? ? 1 : count.to_i )
    end
  end
end


module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
