class Hamming
  def self.compute(s1, s2)

    strand1 = s1.chars
    strand2 = s2.chars

    raise ArgumentError if strand1.length != strand2.length
    
    strand1.zip(strand2)
      .map { |a, b| a == b }
      .select { |b| !b }
      .length

  end
end
