(ns lein-clojure.core)

;; Day 1
(defn big [st n] (> (count st) n))

(defn collection-type [coll]
  (if (= (type coll) clojure.lang.PersistentList) :list
  (if (= (type coll) clojure.lang.PersistentVector) :vector
  (if (= (type coll) clojure.lang.PersistentArrayMap) :map))))

;; Day 2
(defmacro unless [test body else]
  (list 'if (list 'not test) body else))

(defprotocol MyPrinter
  (print-all [this]))

(defrecord CollPrinter [coll]
  MyPrinter
  (print-all [_] (map println coll)))
