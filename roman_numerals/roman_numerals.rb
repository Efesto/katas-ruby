module RomansNumerals
  def self.roman_numerals
    {
        1000 => 'M',
        900 => 'CM',
        500 => 'D',
        400 => 'CD',
        100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
        9 => 'IX',
        5 => 'V',
        4 => 'IV',
        1 => 'I'
    }
  end

  refine Fixnum do
    def to_roman
      remaining_value = self
      roman_numeral = ''

      while remaining_value != 0
        bigger_roman_numeral = RomansNumerals.roman_numerals.find { |digit, numeral| remaining_value >= digit }
        roman_numeral << bigger_roman_numeral[1]
        remaining_value -= bigger_roman_numeral[0]
      end

      roman_numeral
    end
  end

  refine String do
    def to_arabic
      self
    end
  end
end
