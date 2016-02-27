require_relative '../test_case'
require_relative 'roman_numerals.rb'

class RomanNumeralsTest < Test::Unit::TestCase
  using RomansNumerals

  def test_from_arabic_to_roman
    assert_is_roman_equal 'I', 1
    assert_is_roman_equal 'II', 2
    assert_is_roman_equal 'III', 3
    assert_is_roman_equal 'IV', 4
    assert_is_roman_equal 'V', 5
    assert_is_roman_equal 'VI', 6
    assert_is_roman_equal 'VII', 7
    assert_is_roman_equal 'VIII', 8
    assert_is_roman_equal 'IX', 9
    assert_is_roman_equal 'X', 10
    assert_is_roman_equal 'XXIX', 29
    assert_is_roman_equal 'XXXIII', 33
    assert_is_roman_equal 'IL', 49
    assert_is_roman_equal 'L', 50
    assert_is_roman_equal 'C', 100
    assert_is_roman_equal 'D', 500
    assert_is_roman_equal 'M', 1000
    assert_is_roman_equal 'MMXVI', 2016
  end

  def assert_is_roman_equal(expected, modern)

    assert_equal expected, modern.to_roman
  end
end