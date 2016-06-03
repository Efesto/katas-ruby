class String
  def is_palindrome?
    normalized_self = self.gsub(/[^a-z0-9]/i, '').downcase
    normalized_self == normalized_self.reverse
  end
end