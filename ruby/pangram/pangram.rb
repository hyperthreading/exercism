class Pangram
  def self.pangram? str
    maybe_pangram = str.downcase
    alphabets = 'a'..'z'
    alphabets.all? { |ch| maybe_pangram.include? ch }
  end
end