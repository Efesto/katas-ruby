class String
  def palindrome?
    normalized_self = gsub(/[^a-z0-9]/i, '').downcase
    normalized_self == normalized_self.reverse
  end
end
