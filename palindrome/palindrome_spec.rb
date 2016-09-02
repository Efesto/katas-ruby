require_relative 'palindrome_string'

describe '.is_palindrome' do

  it 'returns true on palindrome words' do
    expect_is_palindrome "mi2picip2im"
    expect_is_palindrome "race car"
    expect_is_palindrome "A man, 'a plan', a canal, Panama!"
  end

  it 'returns false on not palindrome words' do
    expect('ciao'.is_palindrome?).to eq false
    expect("something that is not a\npalindrome".is_palindrome?).to eq false
  end

  it 'handles special cases without words' do
    expect_is_palindrome ""
    expect_is_palindrome "!!!!"
    expect_is_palindrome "    "
  end

  def expect_is_palindrome word
      expect(word.is_palindrome?).to eq(true)
  end
end