class Complement
  def self.of_dna(strand)
    compl = {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }
    rna = strand.chars.map {|nucl| compl[nucl]}
    if rna.all?
      rna.join
    else
      ""
    end
  end
end
