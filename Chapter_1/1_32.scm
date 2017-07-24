(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))


(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-ter combiner
                      (combiner null-value (term a))
                      (next a)
                      next
                      b)))
