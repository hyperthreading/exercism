(ns hello-world)

(defn hello
  ([]
   (hello "World"))
  ([name] ;; <- arglist goes here
   (format "Hello, %s!" name))
)
