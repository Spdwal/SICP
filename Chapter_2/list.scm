(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length iters)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
