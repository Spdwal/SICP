(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-spliter painter (- n 1))))
        (below painter (below smaller smaller)))))
