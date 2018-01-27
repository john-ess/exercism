class PhoneNumber

  def self.clean phone_number
    phone_number = phone_number.gsub(/\D/,'').sub(/^[1]/,'')
    phone_number.size != 10 || phone_number.slice(3).to_i < 2 ? nil : phone_number
  end

end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end
