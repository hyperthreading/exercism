(ns reverse-string)

(defn reverse-string [s] ;; <- arglist goes here
  (apply str (map str (reverse s)))
)
