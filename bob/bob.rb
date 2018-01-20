class Bob

  def self.hey remark
    # remove numbers & spaces for testing purposes
    @stripped_remark = remark.gsub(/[\d\s]/,'')

    return 'Whoa, chill out!'   if yelling?
    return 'Sure.'              if question?
    return 'Fine. Be that way!' if silence?
    return 'Whatever.'          # anything else
  end

  private

  def self.yelling?
    !(/[a-z]/ =~ @stripped_remark) && not_numeric?
  end

  def self.question?
     /\?\z/ =~ @stripped_remark
  end

  def self.silence?
    !(/\S/ =~ @stripped_remark)
  end

  def self.not_numeric?
    /[\w]/ =~ @stripped_remark
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
