module RomansNumerals
  refine Fixnum do
    def to_roman
      roman_numeral = ''
      modern_numeral = self

      const_numerals = {
          1000 => 'M',
          500 => 'D',
          100 => 'C',
          50 => 'L',
          10 => 'X',
          5 => 'V'
      }

      while modern_numeral > 0

        numeral = const_numerals.find { |key, value| modern_numeral == key - 1 }
        if numeral
          roman_numeral << "I#{numeral[1]}"
          modern_numeral = modern_numeral - (numeral[0] - 1)
        else
          numeral = const_numerals.find { |key, value| modern_numeral >= key }
          if numeral
            roman_numeral << numeral[1]
            modern_numeral = modern_numeral - (numeral[0])
          else
            modern_numeral.times { roman_numeral << 'I' }
            modern_numeral = 0
          end
        end

      end

      roman_numeral
    end
  end
end