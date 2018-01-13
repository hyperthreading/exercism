(ns bob)

(def byte-a (int \a))
(def byte-z (int \z))
(def byte-A (int \A))
(def byte-Z (int \Z))

(defn is-small-alphabet?
  [chr]
  (let [byt (int chr)]
    (and (<= byte-a byt) (<= byt byte-z))))

(defn is-capital-alphabet?
  [chr]
  (let [byt (int chr)]
    (and (<= byte-A byt) (<= byt byte-Z))))

(defn is-alphabet?
  [chr]
  (or (is-small-alphabet? chr)
      (is-capital-alphabet? chr)))

(defn response-for [say] ;; <- arglist goes here
  (let [no-space  (filter #(not= % \space) say)
        alphabets (filter is-alphabet? no-space)
        capitals  (filter is-capital-alphabet? alphabets)]
    (cond
      (zero? (count no-space))
      "Fine. Be that way!"
      (and (pos? (count alphabets)) (= (count alphabets) (count capitals)))
      "Whoa, chill out!"
      (= (last say) \?)
      "Sure."
      :else
      "Whatever.")))
       
(response-for "Hello.")
