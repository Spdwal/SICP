(define wave
  (segments-painter (list
                     (make-segment (make-vect 0.44 0.7) (make-vect 0.51 0.7)))))

(define (coner-split painter n)
  (if (= n 0)
      painter
      (beside (below painter (up-split painter (- n 1)))
              (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))
