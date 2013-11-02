(defun merge-sort (result-type sequence predicate)
   (let ((split (floor (length sequence) 2)))
     (if (zerop split)
       (copy-seq sequence)
       (merge result-type (merge-sort result-type (subseq sequence 0 split) predicate)
                          (merge-sort result-type (subseq sequence split)   predicate)
                          predicate))))


(print (merge-sort 'list (list 1 3 5 7 9 8 6 4 2) #'<))
