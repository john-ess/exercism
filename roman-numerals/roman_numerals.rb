class Fixnum

  ROMAN_CONVERSION = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  def to_roman
    n     = self
    roman = ''

    ROMAN_CONVERSION.each do |sym, number|
      while n >= number
        roman += sym.to_s
        n     -= number
      end
    end

    roman
  end
end

module BookKeeping
  VERSION = 2
end
