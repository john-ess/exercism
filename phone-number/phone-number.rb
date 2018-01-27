class PhoneNumber

  def self.clean number

    return (number.size == 10) ? number : nil
  end

end
