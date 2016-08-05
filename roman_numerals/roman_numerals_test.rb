require_relative '../test_case'
require_relative 'roman_numerals.rb'

class RomanNumeralsTest < Test::Unit::TestCase
  using RomanNumerals

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
    assert_is_roman_equal 'XLV', 45
    assert_is_roman_equal 'XLVIII', 48
    assert_is_roman_equal 'XLIX', 49
    assert_is_roman_equal 'L', 50
    assert_is_roman_equal 'XC', 90
    assert_is_roman_equal 'XCIX', 99
    assert_is_roman_equal 'C', 100
    assert_is_roman_equal 'CD', 400
    assert_is_roman_equal 'D', 500
    assert_is_roman_equal 'CM', 900
    assert_is_roman_equal 'M', 1000
    assert_is_roman_equal 'CMXCIX', 999
    assert_is_roman_equal 'MCM', 1900
    assert_is_roman_equal 'MMXVI', 2016
  end

  def test_from_roman_to_arabic
    assert_is_arabic_equal 1, 'I'
    assert_is_arabic_equal 2, 'II'
    assert_is_arabic_equal 3, 'III'
    assert_is_arabic_equal 4, 'IV'
  end

  def assert_is_roman_equal(expected, arabic)
    assert_equal expected, arabic.to_roman, "for #{arabic}"
  end

  def assert_is_arabic_equal(expected, actual)
    assert_equal expected, actual.to_arabic
  end
end