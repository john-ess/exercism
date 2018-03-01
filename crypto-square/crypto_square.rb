class Crypto
  include Math

  def initialize text
    @text     = normalize text
    @length   = @text.length
    @sq_root  = Math.sqrt(@length).ceil
  end

  def normalize text
    text.downcase.gsub(/[^A-Z\d]/i,'')
  end

  def equal_length_rows
    @text
      .chars
      .each_slice(@sq_root)
      .map(&:join)
      .map{|series| series.ljust(@sq_root.floor)}
  end

  def ciphertext
    return @text if @length == @sq_root

    equal_length_rows
      .map(&:chars)
      .transpose
      .map(&:join)
      .join(' ')
  end

end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
