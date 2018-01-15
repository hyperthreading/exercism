(ns run-length-encoding)

(defn shrink
  [encoded char]
  (if (= char (:char (last encoded)))
    (conj (vec (drop-last encoded))
          (update (last encoded) :count inc))
    (conj (vec encoded) {:char char
                         :count 1})))

(defn serialize-shrink
  [encoded]
  (clojure.string/join (map #(let [{count :count char :char} %]
                               (if (>= 1 count)
                                 char
                                 (format "%d%s" count char)))
                            encoded)))

(defn get-shrink
  [s]
  (reduce shrink [] s))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [s]
  (serialize-shrink (get-shrink s)))


(def tokens (set
             (concat (range (int \a)
                            (inc (int \z)))
                     (range (int \A)
                            (inc (int \Z)))
                     [(int \space)])))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [s]
  (loop [result  ""
         acc-num "0"
         chrs    s]
    (if (seq chrs)
      (let [chr (first chrs)]
        (if (tokens (int chr))
          (let [count      (Integer/parseInt acc-num)
                new-result (str result (if (> count 1)
                                         (clojure.string/join (repeat count chr))
                                         chr))]
            (recur new-result "0" (rest chrs)))
          (recur result (str acc-num chr) (rest chrs))))
      result)))
