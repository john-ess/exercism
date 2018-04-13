class Acronym
  def self.abbreviate(text)
    # text = 'Portable Network Graphics'
    # return 'PNG'
    text.scan(/\w+/).map{|word| word.byteslice(0).upcase }.join
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end
