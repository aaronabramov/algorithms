(ns graphs.core)

(use '(incanter core stats charts io))

(def data (read-dataset "../3sum.csv"))

(def N (sel data :cols 0))

(def T (sel data :cols 1))


(defn -main [& args]
  (view (xy-plot N T)))
