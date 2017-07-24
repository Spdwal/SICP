(load "1_32.scm")

(define (filter-accululate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filter-accululate combiner
                                       null-value
                                       term
                                       (next a)
                                       next
                                       b
                                       filter
                                       ))
          (else (filter-accululate combiner
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b
                                   fileter)))))
