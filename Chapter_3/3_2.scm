(define (make-monitored x)
  (define count 0)
  (define reset-count
    (set! count 0))
  (define how-many-calls? count)
  (define (dispath y)
    (cond ((eq? y 'how-many-calls?) count)
          ((eq? y 'reset-count) reset-count)
          (else
           (begin (set! count (+ 1 count))
                  x y))))
  dispath)
