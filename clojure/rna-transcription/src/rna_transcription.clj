(ns rna-transcription)

(defn corresponding-rna [nucl]
  (case nucl
    \G \C
    \C \G
    \T \A
    \A \U
    (throw (AssertionError. "Wrong nucleotide argument"))))

(defn to-rna [dna-strands] ;; <- arglist goes here
  (apply str (map corresponding-rna dna-strands)))



