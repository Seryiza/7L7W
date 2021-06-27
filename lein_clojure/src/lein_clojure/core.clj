(ns lein-clojure.core)

;; Day 1
(defn big [st n] (> (count st) n))

(defn collection-type [coll]
  (if (= (type coll) clojure.lang.PersistentList) :list
  (if (= (type coll) clojure.lang.PersistentVector) :vector
  (if (= (type coll) clojure.lang.PersistentArrayMap) :map))))
