class Crypto

  def initialize text
    @normalized_text  = normalize text
    @length           = @normalized_text.length
    @rows             = (@length ** 0.5).ceil
  end

  def normalize text
    text.downcase.gsub(/[^A-Z\d]/i,'')
  end

  def equal_length_set
    @normalized_text
      .chars
      .each_slice(@rows)
      .map(&:join)
      .map{ |series| series.ljust(@rows) }
  end

  def ciphertext
    return @normalized_text if @length == @rows

    equal_length_set
      .map(&:chars)
      .transpose
      .map(&:join)
      .join(' ')
  end

end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
