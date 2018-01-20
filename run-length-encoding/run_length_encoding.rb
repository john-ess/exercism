# THIS IS UGLY
# BUT IT WORKS
# ANY INPUT / SUGGESTIONS MUCH APPRECIATED

class RunLengthEncoding
  def self.encode decoded
    # convert to an array
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
    decoded = String.new

    encoded.scan(/(\d*)(\D)/) do |(k, v)|
       k = !k.empty? ? k : "1"
       decoded << "#{v * k.to_i}"
    end

    decoded
  end

end


module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
