
class RunLengthEncoding
  def self.encode decoded

    order  = decoded.chars.chunk_while(&:==).map(&:first)

    counts = order.map do |letter|
                count = 0
                while decoded[0,1] == letter
                  decoded.slice!(0)
                  count += 1
                end
                count = count > 1 ? count : 0
              end

    counts.zip(order).join.to_s.gsub('0','')
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
