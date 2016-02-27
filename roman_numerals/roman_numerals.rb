module RomansNumerals
  def self.const_numerals
    {
        1000 => 'M',
        500 => 'D',
        100 => 'C',
        50 => 'L',
        10 => 'X',
        5 => 'V',
        1 => 'I'
    }
  end

  refine Fixnum do
    def to_roman
      roman_number = ''
      arabic_number = self

      while arabic_number > 0
        numeral = RomansNumerals.const_numerals.find { |key, value| arabic_number == key - 1 }

        if numeral
          roman_number << "#{RomansNumerals.const_numerals[1]}#{numeral[1]}"
          arabic_number = arabic_number - (numeral[0] - 1)
        else
          numeral = RomansNumerals.const_numerals.find { |key, value| arabic_number >= key }
          roman_number << numeral[1]
          arabic_number = arabic_number - numeral[0]
        end
      end
      roman_number
    end
  end

  refine String do
    def to_arabic
      self
    end
  end
end
